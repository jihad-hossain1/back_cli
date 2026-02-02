#!/bin/bash
# ----------------------------
# Config & Shared
# ----------------------------

GEN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 1. Config
source "$GEN_DIR/config/generate.sh"

# ----------------------------
# Entry point
# ----------------------------

if [ "$FRAMEWORK" == "express" ]; then
  # EXPRESS BOILERPLATE
  source "$GEN_DIR/express/generate.sh"

elif [ "$FRAMEWORK" == "hono" ]; then
  # HONO BOILERPLATE
  source "$GEN_DIR/hono/generate.sh"

else
  # BASIC BOILERPLATE
  source "$GEN_DIR/basic/generate.sh"
fi

# ----------------------------
# README
# ----------------------------
source "$GEN_DIR/readme/generate.sh"
