#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$LANG" == "typescript" ]; then
  envsubst '$PATTERN $DATABASE' < "$MODULE_DIR/templates/typescript/main.ts" > "src/main.$EXT"
else
  envsubst '$PATTERN $DATABASE' < "$MODULE_DIR/templates/javascript/main.js" > "src/main.$EXT"
fi
