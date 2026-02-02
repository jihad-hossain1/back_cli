#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p src/config
if [ ! -f src/config/database.$EXT ]; then
  # Inject variables into database config template
  envsubst '$DATABASE $ORM' < "$MODULE_DIR/templates/database.txt" > "src/config/database.$EXT"
fi
