FROM php:8.3-fpm-alpine

WORKDIR /var/www/laravel

RUN apk update && apk add --update \
		libpq-dev

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install pdo pdo_pgsql

RUN addgroup -g 1000 -S www && \
    adduser -u 1000 -S www -G www

USER www

EXPOSE 9000
