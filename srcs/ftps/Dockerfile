FROM alpine

RUN apk update
RUN apk add --no-cache openssl pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY setup.sh /tmp

EXPOSE 21 21000

CMD sh /tmp/setup.sh