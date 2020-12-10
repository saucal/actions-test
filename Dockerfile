FROM php:alpine

RUN apk --no-cache add \
        libzip-dev \
        zip \
        curl \
  && docker-php-ext-install zip

RUN curl https://raw.githubusercontent.com/saucal/wp-codesniffer-installer/master/install-standards.sh | sh

ENTRYPOINT ["phpcs"]

CMD ["--version"]
