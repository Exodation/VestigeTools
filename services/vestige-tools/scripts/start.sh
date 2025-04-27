
echo "Checking services..."

COMMAND_BUILD="/opt/VestigeTools/services/command-builder/scripts/build.sh"

for servicedir in /opt/VestigeTools/services/*; do

  if [ -d "$servicedir" ]; then
    service_file=$(find "$servicedir" -maxdepth 1 -name "*.service")
    service_name=$(basename $service_file)

    if [ -f "$service_file" ]; then
      # START SERVICES

      chmod +x $servicedir

      # Install the service
      echo "Installing service $service_file..."
      cp "$service_file" /etc/systemd/system/

      # Enable the service
      echo "Enabling service: $service_name"
      sudo systemctl enable "$service_name"

      # Start the service
      echo "Starting service: $service_name"
      sudo systemctl start "$service_name"
    else

        # CUSTOM INIT SCRIPTS
        init_sh=$(find "$servicedir" -maxdepth 1 -name "init.sh")
        if [ -f "$init_sh" ]; then
            echo "Initializing $(basename $service_file)"
            ./$init_sh
        else
            exec_sh=$(find "$servicedir" -maxdepth 1 -name "exec.sh")
            if [ -f "$exec_sh" ]; then
              $COMMAND_BUILD $exec_sh $service_name
            fi
        fi
    fi
  fi
done

sudo systemctl daemon-reload

echo "Vestige tools setup complete"