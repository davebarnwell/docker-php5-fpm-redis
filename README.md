# docker php5 fpm redis

    This container can be found pre-built on docker hub as freshsauce/php5-fpm-redis
    https://registry.hub.docker.com/u/freshsauce/php5-fpm-redis/
    
    It's designed to run php-fpm for a nginx container based on image freshsauce/nginx

  - Based on official php5.6 fpm build
  - exposes port 9000
  - volume /var/www web root is /var/www/html
  - installs pear
  - installs PHP with
    - gd
    - mbstring
    - iconv
    - mcrypt
    - pdo
    - pdo_mysql
    - mysql
    - redis client via pecl
  - expects a php-fpm instance to be running before it's started with an alais of php on port 9000
  - sets the default timezone to Europe/London via build/php.ini which is added to the container

## Pull or build

    docker pull freshsauce/php5-fpm-redis
  
  Or build under your own username on docker

    docker build -t username/php5-fpm .

## Run up with

    docker run --name php -v /host/web/html:/var/www/html \
      --link redis:redis --link mysql:db -d username/php5-fpm-redis

  - links to a mysql constainer aliased as db
  - links to a redis constainer aliased as redis
  - mounts host directory /host/web/html as /var/www/html in the container
