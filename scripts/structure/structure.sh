STRUCTURE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$PATTERN" == "mvp" ]; then
  source "$STRUCTURE_DIR/mvp.sh"
elif [ "$PATTERN" == "solid" ]; then
  source "$STRUCTURE_DIR/solid.sh"
elif [ "$PATTERN" == "ddd" ]; then
  source "$STRUCTURE_DIR/ddd.sh"
fi
