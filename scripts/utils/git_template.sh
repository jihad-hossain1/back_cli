#!/bin/bash
# scripts/utils/git_template.sh

TEMPLATE_REPO="$1"
BRANCH="$2"
TARGET_DIR="$3"
CACHE_BASE_DIR="$HOME/.cache/backend_script/templates"

# Sanitize repo name for folder usage
REPO_NAME=$(basename "$TEMPLATE_REPO" .git)
CACHE_DIR="$CACHE_BASE_DIR/$REPO_NAME/$BRANCH"

mkdir -p "$CACHE_DIR"

if [ -d "$CACHE_DIR/.git" ]; then
  echo "🔄 Updating template cache for $REPO_NAME ($BRANCH)..."
  cd "$CACHE_DIR" || exit
  git pull origin "$BRANCH"
else
  echo "⬇️  Cloning template from $REPO_NAME ($BRANCH)..."
  # Try to clone specific branch, if fails, might mean branch invalid or repo private
  git clone -b "$BRANCH" "$TEMPLATE_REPO" "$CACHE_DIR"
fi

echo "📂 Copying files to project..."
# Copy contents to target, excluding .git
# Ensure target dir exists
mkdir -p "$TARGET_DIR"

# Using rsync for efficient exclusion and copying
if command -v rsync &> /dev/null; then
    rsync -av --exclude='.git' "$CACHE_DIR/" "$TARGET_DIR/"
else
    # Fallback if rsync not available (less robust excludes)
    cp -R "$CACHE_DIR/"* "$TARGET_DIR/"
    rm -rf "$TARGET_DIR/.git" 2>/dev/null
fi
