docker-compose up -d --remove-orphans

docker-compose exec app composer install

docker-compose exec app php artisan key:generate

docker-compose exec app php artisan migrate:fresh --seed