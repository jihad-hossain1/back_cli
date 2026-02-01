echo "🔌 Configuring MySQL2..."
npm install mysql2 > /dev/null

mkdir -p src/config
cat <<EOF > src/config/mysql.$EXT
import mysql from 'mysql2/promise';

export const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: '$PROJECT_NAME',
});
EOF
