FROM alpine

RUN apk update && apk add influxdb \
	&& apk add --no-cache --upgrade bash
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY setup.sh /tmp

EXPOSE 8086

CMD sh /tmp/setup.sh