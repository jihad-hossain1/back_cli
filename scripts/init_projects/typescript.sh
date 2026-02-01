npm init -y > /dev/null
npm install -D typescript @types/node > /dev/null
npx tsc --init > /dev/null

if [ "$FRAMEWORK" == "express" ]; then
  npm install express > /dev/null
  npm install -D @types/express > /dev/null
elif [ "$FRAMEWORK" == "hono" ]; then
  npm install hono > /dev/null
  npm install @hono/node-server > /dev/null
fi
