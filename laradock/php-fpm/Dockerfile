FROM phpdockerio/php:8.3-fpm
WORKDIR "/var/www"

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \
        php8.3-pgsql \
        php8.3-xdebug; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
