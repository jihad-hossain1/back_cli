#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

envsubst '$PATTERN $DATABASE' < "$MODULE_DIR/templates/main.txt" > "src/main.$EXT"
