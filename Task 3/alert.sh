#!/bin/bash

THRESHOLD=85
PARTITION="/"
TO_EMAIL="you@example.com"

MSMTP_CONF="./.msmtprc"

USAGE=$(df -h "$PARTITION" | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "Диск $PARTITION заполнен на $USAGE%!" | msmtp --file="$MSMTP_CONF" "$TO_EMAIL" \
  && echo "Уведомление отправлено: $PARTITION занято на $USAGE%"
else
  echo "ОК: $PARTITION занято на $USAGE%"
fi
