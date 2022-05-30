#!/usr/bin/env sh

composer install --no-interaction --no-ansi --no-scripts --no-progress --no-suggest --no-dev --optimize-autoloader

php /var/www/html/bin/laravels start
