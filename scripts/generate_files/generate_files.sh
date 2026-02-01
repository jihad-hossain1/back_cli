#!/bin/bash
# ----------------------------
# Config & Shared
# ----------------------------
mkdir -p src/config
if [ ! -f src/config/database.$EXT ]; then
cat <<EOF > src/config/database.$EXT
export const databaseConfig = {
  database: "$DATABASE",
  orm: "$ORM",
};
EOF
fi

# ----------------------------
# Entry point
# ----------------------------
cat <<EOF > src/main.$EXT
import { databaseConfig } from "./config/database";

console.log("🚀 App started");
console.log("Mode:", "$PATTERN");
console.log("DB:", databaseConfig.database);
EOF

# ----------------------------
# README
# ----------------------------
cat <<EOF > README.md
# $PROJECT_NAME

## Architecture
- Pattern: $PATTERN
- Database: $DATABASE
- ORM: $ORM
- Language: $LANG

## Setup
1. Install dependencies
2. Run \`src/main.$EXT\`
EOF
