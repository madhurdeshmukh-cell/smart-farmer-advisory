sudo dnf install mariadb105 -y
mysql -h farmer-db.c38owaa4kfyt.ap-southeast-2.rds.amazonaws.com -u admin -p
sudo pip3 install flask boto3 requests pymysql
nano app.py
grep -c "def advisory" app.py
sudo dnf install python3-pip -y
sudo pip3 install flask boto3 requests pymysql
rm -f app.py
nano app.py
grep -c "def advisory" app.py
wc -l app.py
grep -n "^import\|^def \|^@app\|^if __name__\|^app = " app.py
python3 -m py_compile app.py && echo OK
sed -i '88,$d' app.py
tail -4 app.py
python3 -m py_compile app.py && echo OK
export DB_PASS='your-db-password'
sudo -E python3 app.py
export DB_PASS='farmer-db'
sudo -E python3 app.py
export DB_PASS='Farmer#2026db'
sudo -E python3 app.py
mysql -h farmer-db.c38owaa4kfyt.ap-southeast-2.rds.amazonaws.com -u admin -p
sudo pkill -f app.py
cd ~
nano dashboard.html
python3 -m py_compile app.py && echo OK
export DB_PASS='Farmer#2026db'
nohup sudo -E python3 app.py > app.log 2>&1 &
grep -n '@app.route("/' app.py
grep -c "</html>" dashboard.html
tail -5 app.log
sed -i 's|@app.route("/")|@app.route("/old")|' app.py
sed -i '/^if __name__/i @app.route("/")\ndef dash():\n    return open("dashboard.html").read()\n' app.py
grep -n '@app.route("/' app.py | tail -3
python3 -m py_compile app.py && echo OK
sudo pkill -f app.py
export DB_PASS='Farmer#2026db'
nohup sudo -E python3 app.py > app.log 2>&1 &
tail -3 app.log
curl "https://api.openweathermap.org/data/2.5/weather?q=Pune&appid=25bb7b5ef36cd209aefab2f77eaffc0d&units=metric" 
curl "https://api.openweathermap.org/data/2.5/weather?q=Pune&appid=25bb7b5ef36cd209aefab2f77eaffc0d&units=metric"
export OWM_KEY='25bb7b5ef36cd209aefab2f77eaffc0d'
curl "https://api.openweathermap.org/data/2.5/weather?q=Pune&appid=$OWM_KEY&units=metric"
   curl "https://api.openweathermap.org/data/2.5/weather?q=Pune&appid=$OWM_KEY&units=metric"
curl "https://api.openweathermap.org/data/2.5/weather?q=Pune&appid=25bb7b5ef36cd209aefab2f77eaffc0d&units=metric"
export OWM_KEY='25bb7b5ef36cd209aefab2f77eaffc0d'
curl "https://api.openweathermap.org/data/2.5/weather?q=Pune&appid=$OWM_KEY&units=metric"
sudo pkill -f app.py
export DB_PASS='Farmer#2026db'
export OWM_KEY='25bb7b5ef36cd209aefab2f77eaffc0d'
nohup sudo -E python3 app.py > app.log 2>&1 &
tail -3 app.log
USE farmerdb;
[200~mysql -h farmer-db.c38owaa4kfyt.ap-southeast-2.rds.amazonaws.com -u admin -p~
mysql -h farmer-db.c38owaa4kfyt.ap-southeast-2.rds.amazonaws.com -u admin -p
yes
cat app.py
sed -n '1,50p' app.py
sed -n '51,100p' app.py
sed -n '1,60p' dashboard.html
sed -n '61,130p' dashboard.html
 cd ~ 
 export DB_PASS='Farmer#2026db'
 export OWM_KEY='25bb7b5ef36cd209aefab2f77eaffc0d'
 nohup sudo -E python3 app.py > app.log 2>&1 &
tail -3 app.log
curl -s localhost/api/prices/Wheat
cd ~
sudo pkill -f app.py
cat > ~/.farmer.env << 'EOF'
DB_PASS=Kisan7Wheat2026Farm Master pass
OWM_KEY=25bb7b5ef36cd209aefab2f77eaffc0d
EOF

chmod 600 ~/.farmer.env
set -a; source ~/.farmer.env; set +a
nano ~/.farmer.env
set -a; source ~/.farmer.env; set +a
nohup sudo -E python3 app.py > app.log 2>&1 &
tail -5 app.log
curl -s localhost/api/prices/Wheat
tail -30 app.log
grep -nE '^(DB_HOST|DB_USER|DB_PASS|DB_NAME)=' ~/.farmer.env
sed -n '1,25p' app.py
cut -d= -f1 ~/.farmer.env
set -a; source ~/.farmer.env; set +a
sudo pkill -f 'python3 app.py'
nohup sudo -E python3 app.py > app.log 2>&1 &
tail -10 app.log
curl -s localhost/api/prices/Wheat
tail -25 app.log
sudo -E python3 -c 'import os; p=os.getenv("DB_PASS",""); print("DB_PASS loaded:", bool(p)); print("Password length:", len(p))'
nano ~/.farmer.env
cat > ~/.farmer.env <<'EOF
DB_PASS="z9GNAgSvkjpT7Ji"

OWM_KEY="ca2f1da91ba518568c1f83e38c674699"
EOF
chmod 600 ~/.farmer.env
set -a; source ~/.farmer.env; set +a
python3 -c 'import os; print("DB_PASS loaded:", bool(os.getenv("DB_PASS")))'
cat > ~/.farmer.env <<'EOF'
 DB_PASS="z9GNAgSvkjpT7Ji"
 OWM_KEY="ca2f1da91ba518568c1f83e38c674699"
EOF

chmod 600 ~/.farmer.env
set -a; source ~/.farmer.env; set +a
python3 -c 'import os; print("DB_PASS loaded:", bool(os.getenv("DB_PASS")))'
sudo pkill -f '[p]ython3 app.py'
nohup sudo -E python3 app.py > app.log 2>&1 &
curl -s localhost/api/prices/Wheat
nohup sudo -E python3 app.py > app.log 2>&1 &
aws sts get-caller-identity
aws lambda list-functions --region ap-south-1 --query "Functions[].FunctionName"
aws sns list-topics --region ap-south-1
aws sns publish --topic-arn <YOUR_TOPIC_ARN> --message "Test advisory from EC2" --region ap-south-1
grep -ri "arn:aws:sns" ~ 2>/dev/null
aws sns publish --topic-arn arn:aws:sns:ap-south-1:652546415363:YourTopicName --message "Test advisory from EC2" --region ap-south-1
aws sns publish   --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts   --message "Test advisory from EC2"   --region ap-southeast-2
aws sns list-subscriptions-by-topic   --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts   --region ap-southeast-2
aws sns publish   --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts   --message "Test advisory from EC2"   --subject "Farmer Alert Test"   --region ap-southeast-2
aws sts get-caller-identity
ls ~
cat ~/app.py
grep -i "arn:aws:sns" ~/app.py
aws sns list-subscriptions-by-topic   --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts   --region ap-southeast-2
aws sns publish   --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts   --message "Test advisory from EC2"   --subject "Farmer Alert Test"   --region ap-southeast-2
curl -I http://localhost
ps aux | grep app.py
aws sts get-caller-identity
ls ~
cat ~/app.py
aws sns list-subscriptions-by-topic --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts --region ap-southeast-2
aws sns publish --topic-arn arn:aws:sns:ap-southeast-2:652546415363:farmer-alerts --message "Test advisory from EC2" --subject "Farmer Alert Test" --region ap-southeast-2
curl -I http://localhost
ps aux | grep app.py
