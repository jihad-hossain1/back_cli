#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

envsubst '$PROJECT_NAME $FRAMEWORK $PATTERN $DATABASE $ORM $LANG $EXT' < "$MODULE_DIR/templates/README.md" > "README.md"
