#!/bin/bash

MYSQL_USER=$(jq -r '.MYSQL_USER' config.json)
MYSQL_PASSWORD=$(jq -r '.MYSQL_PASSWORD' config.json)
MYSQL_DATABASE=$(jq -r '.MYSQL_DATABASE' config.json)

if [ -n "$MYSQL_USER" ]; then
    docker exec mysql mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > backup.sql

    rclone copy backup.sql Backups:backups
else
    echo "Credentials not set, ignoring backup"
fi