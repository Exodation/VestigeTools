#!/bin/bash

SCRIPTS_DIR=$(dirname "$0")
COMMAND="$1"
SCRIPT_PATH="$SCRIPTS_DIR/$COMMAND.sh"

if [[ -z "$COMMAND" ]]; then
    echo "Usage: $0 {command_name}"
    exit 1
fi

# Check if the corresponding script exists in the scripts folder
if [[ -f "$SCRIPT_PATH" ]]; then
    # Execute the script
    bash "$SCRIPT_PATH"
else
    echo "Error: No script found for the command '$COMMAND'."
    echo "Searched for '$SCRIPT_PATH'."
    exit 1
fi