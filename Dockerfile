FROM php:7.4-fpm

RUN apt-get update && apt-get install -y supervisor nginx
COPY nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf
COPY default /etc/nginx/sites-available/default
COPY index.php /var/www/html/index.php
EXPOSE 80
ENTRYPOINT ["supervisord", "-n"]
