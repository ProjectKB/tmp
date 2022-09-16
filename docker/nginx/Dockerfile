FROM nginx:latest

COPY . /var/www
COPY ./public/index.php /var/www/html/index.php
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
