#!/bin/bash


cd /opt/VestigeTools/services/mysql-backup/
CONFIG_FILE="config.json"

# Check if the config file already exists
echo "Setting up MySQL configuration..."

    # Prompt for MySQL credentials
    read -p "Enter MySQL user: " MYSQL_USER
    read -sp "Enter MySQL password: " MYSQL_PASSWORD
    echo
    read -p "Enter MySQL database name: " MYSQL_DATABASE

    # Create or update the JSON configuration file
    config_content="{
        \"MYSQL_USER\": \"$MYSQL_USER\",
        \"MYSQL_PASSWORD\": \"$MYSQL_PASSWORD\",
        \"MYSQL_DATABASE\": \"$MYSQL_DATABASE\"
    }"

    echo "$config_content" > $CONFIG_FILE

    echo "Configuration saved to $CONFIG_FILE"