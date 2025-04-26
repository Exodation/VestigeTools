
echo "Checking services..."

for servicedir in /usr/local/bin/vestige-tools/services/*; do
  echo $servicedir

  if [ -d "$servicedir" ]; then
    service_file=$(find "$servicedir" -maxdepth 1 -name "*.service")
    
    echo $service_file
    if [ -f "$service_file" ]; then

      # Install the service
      echo "Installing service $service_file..."
      cp "$service_file" /etc/systemd/system/

      # Enable the service
      echo "Enabling service: $(basename $service_file)"
      sudo systemctl enable "$(basename $service_file)"

      # Start the service
      echo "Starting service: $(basename $service_file)"
      sudo systemctl start "$(basename $service_file)"
    fi
  fi
done

sudo systemctl daemon-reload

echo "Vestige tools setup complete"