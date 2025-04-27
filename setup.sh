#!/bin/bash

echo "Installing vestige tools..."

rm -rf /usr/local/bin/vestige-tools
mkdir -p /usr/local/bin/vestige-tools

cp -r ./ /usr/local/bin/vestige-tools

cd /usr/local/bin/vestige-tools

chmod +x ./services/vestige-tools/scripts/start.sh

./services/vestige-tools/scripts/start.sh