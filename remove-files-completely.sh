#!/bin/bash

DATE=$(date +"%d-%m-%Y")

TIMESTAMP=`date +%Y/%m/%d-%H:%M:%S`

DESTINATION_LOGS=/home/avr/sender/input

echo "File(s) delete started at $TIMESTAMP"

cd ${DESTINATION_LOGS}"
rm -rf file*
echo "File(s) delete end at $TIMESTAMP"