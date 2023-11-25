#!/bin/bash

DATABASE_NAME="test_sql"
USER="postgres" # Default user
HOST="localhost"

FILES=("esquema.sql" "dados.sql" "consultas.sql")

for file in "${FILES[@]}"
do
  echo "Running $file..."
  PGPASSWORD=postgres psql --set ON_ERROR_STOP=on -d "$DATABASE_NAME" -U "$USER" -h "$HOST" -f "sql/$file"
  if [ $? -ne 0 ]; then
    echo "Error encountered running $file"
    exit 1
  fi
done

echo "All files executed successfully"
