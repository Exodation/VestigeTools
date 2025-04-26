#!/bin/bash

echo "Installing vestige tools..."

cp ./ /usr/local/bin/vestige-tools
cd /usr/local/bin/vestige-tools

./services/vestige-tools/scripts/start.sh