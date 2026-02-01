#!/bin/bash
# ----------------------------
# Create root & Init
# ----------------------------
mkdir -p "$PROJECT_NAME/src"
cd "$PROJECT_NAME" || exit

INIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "⚙️  Initializing project..."
if [ "$LANG" == "javascript" ]; then
  source "$INIT_DIR/javascript.sh"
elif [ "$LANG" == "typescript" ]; then
  source "$INIT_DIR/typescript.sh"
fi
