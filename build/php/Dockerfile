FROM php:8.4-fpm AS base

WORKDIR /var/www/project

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential autoconf libicu-dev libxslt-dev git libzip-dev zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl opcache zip xsl \
    && apt-get remove --purge -y build-essential autoconf \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY build/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# -----------------------------------
# Development-Stage (with Composer + XDebug)
# -----------------------------------
FROM base AS dev

RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory-limit.ini

COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential autoconf git zip unzip \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug,coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && apt-get remove --purge -y build-essential autoconf \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
