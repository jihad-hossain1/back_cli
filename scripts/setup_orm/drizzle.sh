echo "🔌 Configuring Drizzle..."
npm install drizzle-orm > /dev/null
npm install -D drizzle-kit > /dev/null

# Install driver
if [ "$DATABASE" == "mysql" ]; then
  npm install mysql2 > /dev/null
elif [ "$DATABASE" == "postgresql" ]; then
  npm install postgres > /dev/null
fi

# Create drizzle.config
cat <<EOF > drizzle.config.$EXT
import { defineConfig } from "drizzle-kit";
export default defineConfig({
  dialect: "$DATABASE",
  schema: "./src/schema.$EXT",
  out: "./drizzle",
});
EOF
