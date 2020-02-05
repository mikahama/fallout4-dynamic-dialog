#!/usr/bin/python
import time
import requests, json


logfile = "/mnt/c/Users/Mika/Documents/My Games/Fallout4/Logs/Script/User/CreativityLog.0.log"

# Clear the log file first
try:
    w =open(logfile, "w")
    w.write("")
    w.close()
except:
    print "log could not be cleared"

headers = []
# Monitor the log file
cur = 0
while True:
    try:
        with open(logfile) as f:
            f.seek(0,2)
            if f.tell() < cur:
                f.seek(0,0)
            else:
                f.seek(cur,0)
            for line in f:
                if "{" not in line:
                    continue
                header = line.strip()[:53]
                if header in headers:
                    #already processed
                    continue
                headers.append(header)
                game_data = line.strip()[53:]
                r = requests.post('http://127.0.0.1:5000/startDialog', json=json.loads(game_data.replace("Thieves'","Thieves").replace("'",'"').replace(",}", "}")))
            cur = f.tell()
    except IOError, e:
        pass
    time.sleep(1)
