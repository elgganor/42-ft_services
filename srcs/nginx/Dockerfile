FROM alpine

RUN apk update
RUN apk add nginx openssl openssh openrc --no-cache
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY setup.sh /tmp
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/localhost/
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 22 80 443

CMD sh /tmp/setup.sh