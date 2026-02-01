#!/bin/bash
# ----------------------------
# Git Initialization
# ----------------------------
if [ "$GIT_OPT" == "1" ]; then
  echo "🔧 Initializing Git..."
  git init > /dev/null
  echo "# $PROJECT_NAME" >> README.md
  # Create .gitignore if none exists
  if [ ! -f .gitignore ]; then
    echo "node_modules/" > .gitignore
    echo ".env" >> .gitignore
    echo "dist/" >> .gitignore
    echo "drizzle/" >> .gitignore
  fi
fi

echo "✅ Project $PROJECT_NAME created successfully!"
