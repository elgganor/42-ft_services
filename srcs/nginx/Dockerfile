FROM alpine

RUN apk update
RUN apk add nginx openssl openssh --no-cache

COPY setup.sh /tmp
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/localhost/public/

CMD sh /tmp/setup.sh

EXPOSE 80 443