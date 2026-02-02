#!/bin/bash
MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UTILS_DIR="$MODULE_DIR/../../utils"

# Choose Repo based on Language
if [ "$LANG" == "typescript" ]; then
    REPO_URL="$BASIC_TS_REPO"
    BRANCH="$BASIC_TS_BRANCH"
else
    REPO_URL="$BASIC_REPO"
    BRANCH="$BASIC_BRANCH"
fi

source "$UTILS_DIR/git_template.sh" "$REPO_URL" "$BRANCH" .
