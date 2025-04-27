#!/bin/bash

CONFIG_FILE="/opt/VestigeTools/services/mysql-backup/config.json"


if [ -f "$CONFIG_FILE" ]; then
    MYSQL_USER=$(jq -r '.MYSQL_USER' "$CONFIG_FILE")
    MYSQL_PASSWORD=$(jq -r '.MYSQL_PASSWORD' "$CONFIG_FILE")
    MYSQL_DATABASE=$(jq -r '.MYSQL_DATABASE' "$CONFIG_FILE")

    if [ -n "$MYSQL_USER" ]; then
        echo "Backing up $MYSQL_DATABASE..."

        docker exec mysql mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" > backup.sql

        rclone copy backup.sql Backups:backups

        echo "Successfully backed up database $MYSQL_DATABASE"
    else
        echo "Credentials not set, ignoring backup"
    fi
else
    echo "$CONFIG_FILE not found"
fi