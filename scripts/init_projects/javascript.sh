npm init -y > /dev/null

if [ "$FRAMEWORK" == "express" ]; then
  npm install express > /dev/null
elif [ "$FRAMEWORK" == "hono" ]; then
  npm install hono > /dev/null
  npm install @hono/node-server > /dev/null
fi
