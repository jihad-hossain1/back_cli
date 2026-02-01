echo "🔌 Configuring Prisma..."
npm install prisma --save-dev > /dev/null
npm install @prisma/client > /dev/null
npx prisma init --datasource-provider "$DATABASE"
