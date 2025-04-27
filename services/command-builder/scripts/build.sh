#!/bin/bash

EXEC_FILE=$1
COMMAND_NAME=$2

echo "Linking $COMMAND_NAME to $EXEC_FILE"

ln -sf $EXEC_FILE /usr/local/bin/$COMMAND_NAME

chmod +x $EXEC_FILE
chmod +x /usr/local/bin/$COMMAND_NAME

echo "Successfully linked $COMMAND_NAME to $EXEC_FILE"