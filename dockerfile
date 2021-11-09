FROM php:8.1.0RC5-apache-bullseye

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

#RUN apt-get update 
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update 
RUN apt-get install -y curl libcurl4-openssl-dev pkg-config git zip unzip zlib1g-dev libzip-dev 
RUN docker-php-ext-install curl

RUN pecl install mongodb && docker-php-ext-enable mongodb



EXPOSE 80

WORKDIR /var/www/html/

RUN git clone https://github.com/jscanzoni/mongo_legacy_app.git .
RUN composer require mongodb/mongodb