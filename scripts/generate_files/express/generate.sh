#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UTILS_DIR="$MODULE_DIR/../../utils"

# Choose Repo based on Language
if [ "$LANG" == "typescript" ]; then
    REPO_URL="$EXPRESS_TS_REPO"
    BRANCH="$EXPRESS_TS_BRANCH"
else
    REPO_URL="$EXPRESS_REPO"
    BRANCH="$EXPRESS_BRANCH"
fi

# Fetch and copy template
source "$UTILS_DIR/git_template.sh" "$REPO_URL" "$BRANCH" .
