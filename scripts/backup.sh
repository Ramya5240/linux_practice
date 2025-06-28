#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)
SRC="../files"
DEST="../backups"
LOG="../backups/backup_log.txt"
BACKUP_NAME="backup_$DATE.tar.gz"

tar -czf "$DEST/$BACKUP_NAME" -C "$SRC" .

echo "[$DATE] Backup created: $BACKUP_NAME" >> "$LOG"
ls "$SRC" >> "$LOG"
echo "------------------------" >> "$LOG"

echo "Backup completed."

