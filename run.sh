#!/bin/bash

# ----------------------------
# Interactive Inputs
# ----------------------------

# 1. Project Name
read -p "Enter Project Name: " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
  echo "❌ Project name cannot be empty"
  exit 1
fi

# 2. Programming Language
echo ""
echo "Select Programming Language:"
echo "1) Javascript"
echo "2) Typescript"
read -p "Enter choice (1-2): " LANG_OPT

case $LANG_OPT in
  1) 
    LANG="javascript" 
    EXT="js"
    ;;
  2) 
    LANG="typescript" 
    EXT="ts"
    ;;
  *) echo "❌ Invalid language option"; exit 1 ;;
  *) echo "❌ Invalid language option"; exit 1 ;;
esac

# 2.1 HTTP Framework
echo ""
echo "Select HTTP Framework:"
echo "1) Express.js"
echo "2) Hono.js"
echo "0) None"
read -p "Enter choice (0-2): " FW_OPT

case $FW_OPT in
  1) FRAMEWORK="express" ;;
  2) FRAMEWORK="hono" ;;
  0) FRAMEWORK="none" ;;
  *) echo "❌ Invalid framework option"; exit 1 ;;
esac

# 3. Database Type
echo ""
echo "Select Database Type:"
echo "1) mysql"
echo "2) postgresql"
echo "3) mongodb"
echo "0) Skip"
read -p "Enter choice (0-3): " DB_OPT

case $DB_OPT in
  1) DATABASE="mysql" ;;
  2) DATABASE="postgresql" ;;
  3) DATABASE="mongodb" ;;
  0) DATABASE="none"; ORM="none" ;;
  *) echo "❌ Invalid database option"; exit 1 ;;
esac

# 4. ORM
if [ "$DATABASE" != "none" ]; then
  echo ""
  echo "Select ORM:"

  if [ "$DATABASE" == "mysql" ]; then
    # mysql -> drizzle, prisma, mysql2
    echo "1) drizzle"
    echo "2) prisma"
    echo "3) mysql2"
    echo "0) None"
    read -p "Enter choice (0-3): " ORM_OPT
    
    case $ORM_OPT in
      1) ORM="drizzle" ;;
      2) ORM="prisma" ;;
      3) ORM="mysql2" ;;
      0) ORM="none" ;;
      *) echo "❌ Invalid ORM option for MySQL"; exit 1 ;;
    esac

  elif [ "$DATABASE" == "postgresql" ]; then
    # postgresql -> drizzle, prisma
    echo "1) drizzle"
    echo "2) prisma"
    echo "0) None"
    read -p "Enter choice (0-2): " ORM_OPT

    case $ORM_OPT in
      1) ORM="drizzle" ;;
      2) ORM="prisma" ;;
      0) ORM="none" ;;
      *) echo "❌ Invalid ORM option for PostgreSQL"; exit 1 ;;
    esac

  elif [ "$DATABASE" == "mongodb" ]; then
    # mongodb -> prisma, mongoose
    echo "1) prisma"
    echo "2) mongoose"
    echo "0) None"
    read -p "Enter choice (0-2): " ORM_OPT

    case $ORM_OPT in
      1) ORM="prisma" ;;
      2) ORM="mongoose" ;;
      0) ORM="none" ;;
      *) echo "❌ Invalid ORM option for MongoDB"; exit 1 ;;
    esac
  fi
else
    # Ensure ORM is none if DB is none (redundant safety)
    ORM="none"
fi

# 5. Project Pattern
echo ""
echo "Select Project Pattern:"
echo "1) mvp (Model-View-Presenter / Simple)"
echo "2) solid (Layered Architecture)"
echo "3) ddd (Domain-Driven Design)"
read -p "Enter choice (1-3): " PAT_OPT

case $PAT_OPT in
  1) PATTERN="mvp" ;;
  2) PATTERN="solid" ;;
  3) PATTERN="ddd" ;;
  *) echo "❌ Invalid pattern option"; exit 1 ;;
esac

# 6. Git Initialization
echo ""
echo "Initialize Git?"
echo "1) Yes"
echo "0) No"
read -p "Enter choice (1/0): " GIT_OPT

echo "🚀 Creating $PATTERN project in $LANG"
echo "📦 Project : $PROJECT_NAME"
echo "🗄️  Database: $DATABASE"
echo "🔌 ORM      : $ORM"
echo "🏗️ Pattern  : $PATTERN"
echo "💻 Language : $LANG"

# ----------------------------
# Execute Modules
# ----------------------------

# Export variables for child scripts
export PROJECT_NAME LANG EXT DATABASE ORM PATTERN GIT_OPT FRAMEWORK

# Get script directory for reliable sourcing
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$SCRIPT_DIR/scripts/init_projects/init_project.sh"
source "$SCRIPT_DIR/scripts/setup_orm/setup_orm.sh"
source "$SCRIPT_DIR/scripts/structure/structure.sh"
source "$SCRIPT_DIR/scripts/generate_files/generate_files.sh"
source "$SCRIPT_DIR/scripts/init_git/git_init.sh"
