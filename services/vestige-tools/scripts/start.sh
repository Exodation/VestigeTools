
echo "Checking services..."

COMMAND_BUILD="/opt/VestigeTools/services/command-builder/scripts/build.sh"

for servicedir in /opt/VestigeTools/services/*; do

  if [ -d "$servicedir" ]; then
    service_file=$(find "$servicedir" -maxdepth 1 -name "*.service")
    service_name=$(basename "$servicedir")

    if [ -f "$service_file" ]; then
      # START SERVICES

      chmod +x $servicedir

      # Install the service
      echo "Installing service $service_file..."
      cp "$service_file" /etc/systemd/system/

      # Enable the service
      sudo systemctl enable "$service_name"

      # Start the service
      sudo systemctl start "$service_name"

      echo "Started service $service_name"
    else
      # CUSTOM INIT SCRIPTS
      init_sh=$(find "$servicedir" -maxdepth 1 -name "init.sh")
      if [ -f "$init_sh" ]; then
          echo "Initializing $(basename $service_file)"
          ./$init_sh
      fi
    fi

    

    # CUSTOM COMMANDS
    exec_sh=$(find "$servicedir" -maxdepth 1 -name "exec.sh")
    if [ -f "$exec_sh" ]; then
      echo "Attemping $service_name"
      $COMMAND_BUILD $exec_sh $service_name
    fi
  fi
done

sudo systemctl daemon-reload

echo "Vestige tools setup complete"