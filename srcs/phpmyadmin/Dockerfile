FROM alpine

RUN apk update
RUN apk add --no-cache wget \
	php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY setup.sh /tmp
COPY config.inc.php /tmp

EXPOSE 5000

CMD sh /tmp/setup.sh