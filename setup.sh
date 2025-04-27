#!/bin/bash

echo "Installing vestige tools..."

chmod +x ./services/vestige-tools/scripts/start.sh

ln -sf /opt/VestigeTools/services/vestige-tools/exec.sh /usr/local/bin/vestige-tools

chmod +x /usr/local/bin/vestige-tools

./services/vestige-tools/scripts/start.sh