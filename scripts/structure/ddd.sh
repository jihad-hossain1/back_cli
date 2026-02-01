echo "📂 Generating Standard DDD Modular Structure..."
mkdir -p src/{modules,shared}

# 1. Shared Kernel (Core building blocks)
echo "  - Creating Shared Kernel"
mkdir -p src/shared/core
mkdir -p src/shared/domain/{events,value-objects,entities}
mkdir -p src/shared/infra/{database,http,mapper,logging}
mkdir -p src/shared/utils

# 2. Modules (Example)
MODULES=("user")

for MODULE in "${MODULES[@]}"
do
  echo "  - Creating module: $MODULE"
  
  # Domain Layer (Enterprise Business Rules)
  mkdir -p src/modules/$MODULE/domain/{entities,events,repositories,value-objects,services}
  
  # Application Layer (Application Business Rules)
  mkdir -p src/modules/$MODULE/application/use-cases
  mkdir -p src/modules/$MODULE/application/dtos
  mkdir -p src/modules/$MODULE/application/mappers
  mkdir -p src/modules/$MODULE/application/subscribers
  
  # Infrastructure Layer (Frameworks & Drivers)
  mkdir -p src/modules/$MODULE/infrastructure/persistence/{drizzle,prisma,mongoose}
  mkdir -p src/modules/$MODULE/infrastructure/http/{controllers,routes,middlewares}
  
  # Gitkeeps for empty folders
  touch src/modules/$MODULE/domain/events/.gitkeep
  touch src/modules/$MODULE/application/use-cases/.gitkeep
done

# DI Container Setup
mkdir -p src/shared/infra/di
cat <<EOF > src/shared/infra/di/container.$EXT
import { databaseConfig } from "@/config/database";

// Basic DI Container Stub
export const container = {
  resolve: (name: string) => {
    console.log(\`Resolving \${name}...\`);
  }
};
EOF
