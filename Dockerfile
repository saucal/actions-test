FROM php:alpine

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache add \
        libzip-dev \
        zip \
        curl \
        jq \
        git \
  && docker-php-ext-install zip

RUN curl https://raw.githubusercontent.com/saucal/wp-codesniffer-installer/master/install-standards.sh | sh

RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
