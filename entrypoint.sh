#!/bin/sh

echo "Starting simplesync application"
echo "Loaded schedule: $CRON_SCHEDULE"

echo "$CRON_SCHEDULE /app/sync.sh " > /etc/crontabs/root
crond -f
