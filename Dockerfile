#FROM wordpress:cli-php5.6
#FROM wordpress:cli-php7.0
#FROM wordpress:cli-php7.1
#FROM wordpress:cli-php7.2

FROM wordpress:php5.6

RUN apt-get update \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

WORKDIR /var/www/html

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp
RUN wp core download --skip-content --force --allow-root

COPY ./Docker/bin/docker-entrypoint-wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint-wp.sh

COPY ./Docker/bin/wait-for.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wait-for.sh

COPY ./Docker/wp-config.php ./wp-config.php

ENTRYPOINT [ "docker-entrypoint-wp.sh" ]