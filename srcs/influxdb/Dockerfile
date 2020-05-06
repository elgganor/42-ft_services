FROM alpine

RUN apk update
RUN apk add --no-cache influxdb openrc
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY setup.sh /tmp

EXPOSE 8086

ENTRYPOINT /etc/init.d/telegraf start; sh /tmp/setup.sh