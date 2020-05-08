FROM alpine

RUN apk update
RUN apk add --no-cache openssl pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY setup.sh /tmp
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21 21000

CMD sh /tmp/setup.sh