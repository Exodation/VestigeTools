#!/bin/bash

echo "Installing vestige tools..."

rm -rf /usr/local/bin/vestige-tools
mkdir -p /usr/local/bin/vestige-tools

cp -r ./ /usr/local/bin/vestige-tools

cd /usr/local/bin/vestige-tools
