migration_filenames=$(ls src/migrations/*.sql | sort)
for filename in $migration_filenames; do 
  cat $filename | psql --host localhost -p 5432 --username=postgres
done;