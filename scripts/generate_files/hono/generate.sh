#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UTILS_DIR="$MODULE_DIR/../../utils"

# Choose Repo based on Language
if [ "$LANG" == "typescript" ]; then
    REPO_URL="$HONO_TS_REPO"
    BRANCH="$HONO_TS_BRANCH"
else
    REPO_URL="$HONO_REPO"
    BRANCH="$HONO_BRANCH"
fi

source "$UTILS_DIR/git_template.sh" "$REPO_URL" "$BRANCH" .
