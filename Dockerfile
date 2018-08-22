#
# Dockerfile for Nginx
#
# Boilerplate project using nginx with PHP support.
#
# Author: Martin Bergek
# Copyright © 2018 Martin Bergek
#

FROM alpine:3.8
LABEL   Maintainer="Martin Bergek" \
        Description="Sample container with Nginx"

RUN apk --no-cache add supervisor nginx php7 php7-fpm

# Create necessary directories
RUN mkdir -p /var/www/default /run/nginx /var/log/supervisor \
    /var/log/php-fpm /run/php5-fpm

# Configure SSH server
COPY rootfs/etc/supervisor/supervisord.conf /etc/supervisord.conf

# Configure Nginx
COPY rootfs/var/www/ /var/www/default/
COPY rootfs/etc/nginx/default.conf /etc/nginx/conf.d/

# Configure PHP-FPM
COPY rootfs/etc/php/fpm-pool.conf /etc/php7/php-fpm.d/custom.conf
COPY rootfs/etc/php/php.ini /etc/php7/conf.d/custom.ini

# Configure web server
EXPOSE 80
COPY rootfs/var/www /var/www/default
WORKDIR /var/www/default

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
