FROM php:5.6-fpm
MAINTAINER Dave Barnwell <dave@freshsace.co.uk>
# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install mbstring iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN docker-php-ext-install pdo pdo_mysql mysql
RUN apt-get install -y php-pear php5-dev \
    && pecl install redis \
    && touch /usr/local/etc/php/conf.d/redis.ini \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
ADD build/php.ini   /usr/local/etc/php/conf.d/php.ini
EXPOSE 9000
VOLUME /var/www
CMD ["php-fpm"]