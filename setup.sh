#!/bin/bash

echo "Installing vestige tools..."

chmod +x ./services/vestige-tools/scripts/start.sh

ln -s /opt/vestige-tools/services/vestige-tools/exec.sh /usr/local/bin/vestige-tools

./services/vestige-tools/scripts/start.sh