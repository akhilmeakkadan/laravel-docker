build:
	docker-compose build --no-cache --force-rm
stop: 
	docker-compose stop
up:
	docker-compose up -d
setup:
	@make build
	@make up
	@make composer-update
composer-update:
	docker exec laravel-docker bash -c "composer update"
data:
	docker exec laravel-docker  bash -c "php artisan migrate"
	docker exec laravel-docker  bash -c "php artisan db:seed"
# 	Access contatiner:
# 		docker exec -it <container name> bash

# 	crete laravel project:
# 		create-project laravel/laravel <project name> or  . (. will create inside var/www/html)
		
# 	exit:
# 		exit

# by go to main dir and run make up,stop your commands will exec auto

#hit http://localhost:9001
# server : mysql_db
# Username: root
# password: root

#enable Database->seeders->DatabaseSeeder.php and enable create method
#this will create dumbp data