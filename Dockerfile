FROM php:7.0-fpm


LABEL maintainer="Shmuel Maruani | LimitlessV | Limitless Virtue LLC"

ENV XDEBUG_PORT 9000

RUN docker-php-ext-install pdo_mysql

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug


RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	libfreetype6-dev \
	libicu-dev \
    libssl-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libedit-dev \
	libedit2 \
	libxslt1-dev \
	apt-utils \
	gnupg \
	redis-tools \
	mysql-client \
	git \
	vim \
	wget \
	curl \
	lynx \
	psmisc \
	unzip \
	tar \
	cron \
	bash-completion \
    && apt-get clean

ADD opt/limitlessv/php/php.ini /usr/local/etc/php/php.ini

VOLUME /var/www/html
WORKDIR /var/www/html


#COPY conf/php.ini /etc/php/7.1/fpm/conf.d/40-custom.ini