FROM php:7.2.18-cli
MAINTAINER anythink

COPY mote /etc/motd
COPY bashrc /root/.bashrc

RUN apt-get update  && \
    apt-get install libbz2-dev libzip-dev libssl-dev procps iproute unzip git-core libfreetype6-dev  libjpeg62-turbo-dev libmcrypt-dev libpng-dev librabbitmq-dev -y && \
    docker-php-source extract && \
    docker-php-ext-install bcmath bz2 pcntl exif pdo_mysql mysqli zip gd sockets && \
    pecl install amqp && docker-php-ext-enable amqp && \
    pecl install inotify  && docker-php-ext-enable inotify && \
    pecl install redis && docker-php-ext-enable redis &&  \
    curl -fsSL 'https://github.com/swoole/swoole-src/archive/master.tar.gz' -o swoole.tar.gz \
        && mkdir -p swoole \
        && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
        && rm swoole.tar.gz \
        && ( \
            cd swoole \
            && phpize \
            && ./configure --enable-openssl --enable-http2 --enable-mysqlnd \
            && make -j$(nproc) \
            && make install \
        ) \
        && rm -r swoole \
        && docker-php-ext-enable swoole \
    && docker-php-source delete \
    && curl -sS https://install.phpcomposer.com/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer config -g repo.packagist composer https://packagist.laravel-china.org \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN  echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc


VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["/bin/bash"]
