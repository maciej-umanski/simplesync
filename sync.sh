#!/bin/sh

SOURCE_DIR="/source"
TARGET_DIR="/target"
BACKUP_DIR="/backup"
LOGS_DIR="/logs"

LOG_FILE="$LOGS_DIR/sync_$(date +'%Y-%m-%d_%H-%M').log"

echo "$(date): Sync started"
rsync -avh --backup --delete --backup-dir="$BACKUP_DIR" "$SOURCE_DIR"/* "$TARGET_DIR" >> "$LOG_FILE" 2>&1
echo "$(date): Sync completed, saved log to $LOG_FILE"
