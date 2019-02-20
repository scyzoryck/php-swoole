FROM php:7.3-cli-alpine

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl $PHPIZE_DEPS
RUN pecl install swoole
RUN touch /usr/local/etc/php/conf.d/swoole.ini && \
    echo 'extension=swoole.so' > /usr/local/etc/php/conf.d/swoole.ini
RUN mkdir -p /app
WORKDIR /app

ADD install_composer.sh .
RUN sh ./install_composer.sh

EXPOSE 80
CMD ["sh"]
