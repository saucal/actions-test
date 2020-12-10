FROM php

RUN apt-get update -y \
  && apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

RUN curl https://raw.githubusercontent.com/saucal/wp-codesniffer-installer/master/install-standards.sh | bash

ENTRYPOINT ["phpcs"]

CMD ["--version"]
