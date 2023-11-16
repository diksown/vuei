#!/bin/bash

DATABASE_NAME="test_sql"
USER="postgres" # Default user
HOST="localhost"

FILES=("schema.sql" "triggers.sql" "mock_data.sql")

for file in "${FILES[@]}"
do
  echo "Running $file..."
  PGPASSWORD=postgres psql -d "$DATABASE_NAME" -U "$USER" -h "$HOST" -f "$file"
  if [ $? -ne 0 ]; then
    echo "Error encountered running $file"
    exit 1
  fi
done

echo "All files executed successfully"