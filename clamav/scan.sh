#!/usr/bin/env /bin/sh
# Perform a scan, but only if one isn't already in progress
if [ -z "$1"]
  then
    SCAN_DIR="/host-fs/opt"
else
    SCAN_DIR=$1
fi

echo "Start Scanning..." $SCAN_DIR

LOCK="/tmp/clamscan.lock"

if [ -f "$LOCK" ];then
  echo "Scan already in progress. Aborting."
  exit
else
  touch $LOCK
  echo `date` Starting scan |tee -a /logs/clamscan.log
  /app/clamscan \
    --connextdds=ClamScanParticipantLibrary::ClamScanParticipant::ClamScanPublisher::AntiVirusWriter \
    --verbose \
    --stdout \
    --log=/logs/clamscan.log \
    --recursive \
    --database=/data \
    $SCAN_DIR
  rm $LOCK
fi
