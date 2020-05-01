FROM alpine

RUN apk update
RUN apk add nginx openssl openssh openrc --no-cache

COPY setup.sh /tmp
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/localhost/

EXPOSE 22 80 443

CMD sh /tmp/setup.sh