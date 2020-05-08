FROM alpine

RUN apk update
RUN apk add --no-cache php7 \
	php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY setup.sh /tmp
COPY config.inc.php /tmp
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000

CMD sh /tmp/setup.sh