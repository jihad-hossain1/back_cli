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

if [ "$FRAMEWORK" == "express" ]; then
# EXPRESS BOILERPLATE

if [ "$LANG" == "typescript" ]; then
cat <<EOF > src/main.$EXT
import express, { Request, Response } from 'express';
import { databaseConfig } from "./config/database";

const app = express();
const port = 3000;

app.use(express.json());

app.get('/', (req: Request, res: Response) => {
  res.json({
    message: '🚀 Express App started',
    mode: '$PATTERN',
    db: databaseConfig.database
  });
});

app.listen(port, () => {
  console.log(\`🚀 Server running at http://localhost:\${port}\`);
});
EOF

else
# Javascript Express
cat <<EOF > src/main.$EXT
import express from 'express';
import { databaseConfig } from "./config/database";

const app = express();
const port = 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    message: '🚀 Express App started',
    mode: '$PATTERN',
    db: databaseConfig.database
  });
});

app.listen(port, () => {
  console.log(\`🚀 Server running at http://localhost:\${port}\`);
});
EOF
fi

elif [ "$FRAMEWORK" == "hono" ]; then
# HONO BOILERPLATE
cat <<EOF > src/main.$EXT
import { serve } from '@hono/node-server';
import { Hono } from 'hono';
import { databaseConfig } from "./config/database";

const app = new Hono();

app.get('/', (c) => {
  return c.json({
    message: '🚀 Hono App started',
    mode: '$PATTERN',
    db: databaseConfig.database
  });
});

const port = 3000;
console.log(\`🚀 Server is running on http://localhost:\${port}\`)

serve({
  fetch: app.fetch,
  port
});
EOF

else
# BASIC BOILERPLATE
cat <<EOF > src/main.$EXT
import { databaseConfig } from "./config/database";

console.log("🚀 App started");
console.log("Mode:", "$PATTERN");
console.log("DB:", databaseConfig.database);
EOF
fi

# ----------------------------
# README
# ----------------------------
cat <<EOF > README.md
# $PROJECT_NAME

## Architecture
- Framework: $FRAMEWORK
- Pattern: $PATTERN
- Database: $DATABASE
- ORM: $ORM
- Language: $LANG

## Setup
1. Install dependencies
2. Run \`src/main.$EXT\`
EOF
