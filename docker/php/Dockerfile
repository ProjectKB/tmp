FROM php:8.1-fpm

WORKDIR /var/www

COPY . /var/www
COPY ./public/index.php /var/www/html/index.php

# Every packages needed
RUN apt-get update && apt-get install \
      vim \
      wget \
      git \
      gcc \
      libgssapi-krb5-2 \
      libkrb5-dev \
      libsasl2-modules-gssapi-mit \
      libzip-dev \
      libmagickwand-dev \
      libldb-dev \
      libldap2-dev -y --fix-missing

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony-cli
RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Install zip, exif, ldap, krb5, imagick php extensions
RUN docker-php-ext-install zip
RUN docker-php-ext-install exif
RUN docker-php-ext-install ldap
RUN pecl install krb5 && docker-php-ext-enable krb5
RUN pecl install imagick && docker-php-ext-enable imagick

RUN composer install