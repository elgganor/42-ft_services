FROM alpine

RUN apk update
RUN apk add --no-cache openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz \
	&& tar -zxvf grafana-6.7.3.linux-amd64.tar.gz \
	&& mv grafana-6.7.3 grafana \
	&& rm -rf grafana-6.7.3.linux-amd64.tar.gz
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY setup.sh /tmp
COPY grafana.db /grafana/data/grafana.db
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

WORKDIR /grafana

EXPOSE 3000

ENTRYPOINT /etc/init.d/telegraf start; sh /tmp/setup.sh