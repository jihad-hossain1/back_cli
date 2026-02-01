#!/bin/bash
# ----------------------------
# ORM Configuration
# ----------------------------

ORM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$ORM" == "prisma" ]; then
  source "$ORM_DIR/prisma.sh"
elif [ "$ORM" == "drizzle" ]; then
  source "$ORM_DIR/drizzle.sh"
elif [ "$ORM" == "mysql2" ]; then
  source "$ORM_DIR/mysql2.sh"
elif [ "$ORM" == "mongoose" ]; then
  source "$ORM_DIR/mongoose.sh"
fi
