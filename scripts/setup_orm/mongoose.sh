echo "🔌 Configuring Mongoose..."
npm install mongoose > /dev/null

mkdir -p src/config
cat <<EOF > src/config/mongoose.$EXT
import mongoose from 'mongoose';

export const connectDB = async () => {
  try {
    await mongoose.connect('mongodb://localhost:27017/$PROJECT_NAME');
    console.log('MongoDB Connected');
  } catch (error) {
    console.error('MongoDB Connection Error:', error);
    process.exit(1);
  }
};
EOF
