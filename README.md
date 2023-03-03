# Symfony docker

## Reasons for creating repo
I use docker as my main development environment and want to have
easy accessible template for starting new project   

## What is here? 
- [x] web server (nginx)
- [x] php
- [x] mysql

Maybe there will be other services I need in future like redis, memcached etc.

## How to use

Clone the project
```
git clone https://github.com/vltrof/docker-for-symfony.git
cd ./docker-for-symfony
```
Start project in Docker
```
docker compose up -d 
#or docker-compose up -d
```
Exec to php container (check name of the container)
```
docker exec -it docker-for-symfony-php-1 /bin/bash
```
Install symfony
```
dos2unix install-symfony.sh
/bin/bash install-symfony.sh
```
Done! You have clear git repo and symfony project ready to use!
