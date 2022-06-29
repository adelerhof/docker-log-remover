#!/bin/bash

DATE=$(date +"%d-%m-%Y")
SOURCE_LOGS=/home/avr/logs
cd ${SOURCE_LOGS}
# rm -rf file*

TIMESTAMP=`date +%Y/%m/%d-%H:%M:%S`

DESTINATION_LOGS=/home/avr/sender/input

LOG_FILE_NAMES=$(ls -tr file*)

echo "File(s) copy started at $TIMESTAMP"


for FILE_NAME in $LOG_FILE_NAMES; do
  if [ -f "$FILE_NAME" ]; then
      mv $FILE_NAME ${DESTINATION_LOGS}/"COPY."$FILE_NAME
      mv ${DESTINATION_LOGS}/"COPY."$FILE_NAME ${DESTINATION_LOGS}/$FILE_NAME
      echo "$FILE_NAME copied success to destination folder ${DESTINATION_LOGS}"
  else
      echo "File does not exist."
  fi
done
echo "File(s) copy end at $TIMESTAMP"

rm -rf file*