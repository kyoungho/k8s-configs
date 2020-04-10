#!/usr/bin/python3

import os

# Schedule a filesystem scan every hour unless one is in progress.
#os.system("echo \"$(($RANDOM % 60))   *   *   *   *   /scan.sh > /proc/1/fd/1 2>&1\" > /root.crontab")
#os.system("fcrontab -u root /root.crontab")
#os.system("rm /root.crontab")

# Bootstrap the database if clamav is running for the first time
os.system("[ -f /data/main.cvd ] || /app/freshclam --config-file=/app/conf/freshclam.conf")

# Run the update daemon
os.system("/app/freshclam -d -c 6 --config-file=/app/conf/freshclam.conf")

# Run cron
#os.system("/usr/sbin/fcron -d")

# Run clamav
os.system("/app/clamd --config-file=/app/conf/clamd.conf")
