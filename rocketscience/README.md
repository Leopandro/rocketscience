**Установка**
- Папка rocketscience
 - cp .env.example .env
- Папка laradock
- cp .env.example .env
- make up
- docker compose exec workspace composer install
- docker compose exec workspace php artisan migrate
- docker compose exec workspace php artisan db:seed --class=FillProductPropertiesSeeder
