FROM saucal/reviewdog-php

RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s

RUN apk --no-cache add jq git
