import os, requests, boto3, pymysql
from flask import Flask, jsonify

app = Flask(__name__)

DB = dict(host="farmer-db.c38owaa4kfyt.ap-southeast-2.rds.amazonaws.com",
          user="admin", password=os.environ.get("DB_PASS", ""),
          database="farmerdb", cursorclass=pymysql.cursors.DictCursor)
TOPIC_ARN = "arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts"
OWM_KEY = os.environ.get("OWM_KEY", "")
sns = boto3.client("sns", region_name="ap-southeast-2")

def q(sql, args=None, commit=False):
    conn = pymysql.connect(**DB)
    try:
        with conn.cursor() as c:
            c.execute(sql, args)
            if commit:
                conn.commit()
            return c.fetchall()
    finally:
        conn.close()

def get_weather(city):
    if OWM_KEY:
        r = requests.get("https://api.openweathermap.org/data/2.5/weather",
            params={"q": city, "appid": OWM_KEY, "units": "metric"}, timeout=10).json()
        return dict(temp=r["main"]["temp"], humidity=r["main"]["humidity"],
                    rain=r.get("rain", {}).get("1h", 0),
                    desc=r["weather"][0]["description"])
    return dict(temp=29.0, humidity=78, rain=12.0, desc="heavy rain (sample data)")

@app.route("/api/weather/<city>")
def weather(city):
    w = get_weather(city)
    q("INSERT INTO weather_logs (district,temp_c,humidity,rain_mm,description) VALUES (%s,%s,%s,%s,%s)",
      (city, w["temp"], w["humidity"], w["rain"], w["desc"]), commit=True)
    return jsonify(w)

@app.route("/api/prices/<crop>")
def prices(crop):
    rows = q("SELECT price_date, price_per_quintal FROM market_prices WHERE crop=%s ORDER BY price_date", (crop,))
    for r in rows:
        r["price_date"] = str(r["price_date"])
    return jsonify(rows)

@app.route("/api/advisory/<int:farmer_id>")
def advisory(farmer_id):
    f = q("SELECT * FROM farmers WHERE id=%s", (farmer_id,))[0]
    w = get_weather(f["district"])
    p = q("SELECT price_per_quintal FROM market_prices WHERE crop=%s ORDER BY price_date", (f["crop"],))
    tips = []
    drop = 0
    if len(p) >= 2:
        drop = (p[0]["price_per_quintal"] - p[-1]["price_per_quintal"]) / p[0]["price_per_quintal"] * 100
    rainy = w["rain"] >= 10 or "rain" in w["desc"]
    if rainy:
        tips.append("Heavy rain expected: delay spraying and protect harvested crop.")
    if drop >= 5:
        tips.append(f"{f['crop']} price fell {drop:.1f}% recently: consider holding stock.")
    if rainy and drop >= 5:
        tips.append("Rain plus falling prices: avoid selling now, store the crop safely.")
    return jsonify(farmer=f["name"], weather=w, price_drop_pct=round(drop, 1), advisory=tips)

@app.route("/api/send-alerts")
def send_alerts():
    sent = []
    for f in q("SELECT * FROM farmers"):
        data = advisory(f["id"]).get_json()
        if data["advisory"]:
            msg = f"Hello {f['name']}: " + " ".join(data["advisory"])
            sns.publish(TopicArn=TOPIC_ARN, Subject="Farm Advisory Alert", Message=msg)
            q("INSERT INTO alerts (farmer_id, alert_type, message) VALUES (%s,%s,%s)",
              (f["id"], "advisory", msg[:255]), commit=True)
            sent.append(msg)
    return jsonify(sent=sent)

@app.route("/old")
def home():
    return """<h2>Smart Farmer Advisory</h2>
<p><a href='/api/advisory/1'>Advisory for farmer 1</a></p>
<p><a href='/api/prices/Wheat'>Wheat prices</a></p>
<p><a href='/api/weather/Pune'>Pune weather</a></p>
<p><a href='/api/send-alerts'>Send alerts now (SNS)</a></p>"""

@app.route("/")
def dash():
    return open("dashboard.html").read()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
