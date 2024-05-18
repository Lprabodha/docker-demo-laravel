set -e
  


echo "=== Execute docker-compose build... ==="
docker-compose build
echo "=== docker-compose build is done!! ==="

echo "=== Installing composer... ==="
docker-compose run app composer update
echo "=== Composer build is done!! ==="

echo "==== Generating the app key ==="
docker-compose run app php artisan key:generate
echo "==== App key generating is done!! ==="

echo "==== Migrating and seed database ==="
docker-compose run app php artisan migrate:fresh --seed
echo "==== Migrating and seed database is done!! ==="
