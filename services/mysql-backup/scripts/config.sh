#!/bin/bash


cd /opt/VestigeTools/services/mysql-backup/
CONFIG_FILE="config.json"

# Check if the config file already exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Setting up MySQL configuration..."

    # Prompt for MySQL credentials
    read -p "Enter MySQL user: " MYSQL_USER
    read -sp "Enter MySQL password: " MYSQL_PASSWORD
    echo
    read -p "Enter MySQL database name: " MYSQL_DATABASE

    # Create or update the JSON configuration file
    cat <<EOF > "$CONFIG_FILE"
{
  "MYSQL_USER": "$MYSQL_USER",
  "MYSQL_PASSWORD": "$MYSQL_PASSWORD",
  "MYSQL_DATABASE": "$MYSQL_DATABASE"
}
EOF

    echo "Configuration saved to $CONFIG_FILE"
else
    echo "$CONFIG_FILE already exists. No changes made."
fi