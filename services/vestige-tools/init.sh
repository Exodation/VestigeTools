#!/bin/bash
# Path to your scripts directory
SCRIPTS_DIR="./scripts"

# Check if the passed subcommand corresponds to a script in the 'scripts' directory
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
    exit 1
fi