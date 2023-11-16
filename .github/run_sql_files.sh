#!/bin/bash

DATABASE_NAME="test_sql"
USER="postgres" # Default user
HOST="localhost"

FILES=("esquema.sql" "triggers.sql" "dados.sql" "consultas.sql")

for file in "sql/${FILES[@]}"
do
  echo "Running $file..."
  PGPASSWORD=postgres psql -d "$DATABASE_NAME" -U "$USER" -h "$HOST" -f "$file"
  if [ $? -ne 0 ]; then
    echo "Error encountered running $file"
    exit 1
  fi
done

echo "All files executed successfully"