FROM phpswoole/swoole:php8.0-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pcntl

RUN docker-php-ext-install pdo_mysql

RUN set -ex \
    && apk --no-cache add autoconf g++ make \
    && pecl update-channels \
    && pecl install redis-stable \
    && docker-php-ext-enable redis \
    && rm -rf /tmp/pear \
    && apk del autoconf g++ make

COPY start-container.sh /usr/local/bin/start-container

RUN chmod +x /usr/local/bin/start-container

EXPOSE 5200

ENTRYPOINT ["/usr/local/bin/start-container"]
