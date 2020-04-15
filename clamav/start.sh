#!/usr/bin/env /bin/sh
[ -f /data/main.cvd ] || /app/freshclam --config-file=/app/conf/freshclam.conf
/app/freshclam -d -c 6 --config-file=/app/conf/freshclam.conf
echo "Update is completed. Ready to scan"
sleep infinity

