FROM alpine

RUN apk update
RUN apk add --no-cache --upgrade bash \
	&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz \
	&& tar -zxvf grafana-6.7.3.linux-amd64.tar.gz \
	&& mv grafana-6.7.3 grafana \
	&& rm -rf grafana-6.7.3.linux-amd64.tar.gz

COPY setup.sh /tmp
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY grafana.db /grafana/data/grafana.db

WORKDIR /grafana

EXPOSE 3000
CMD sh /tmp/setup.sh