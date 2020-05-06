openrc
touch /run/openrc/softlevel
rc-update add telegraf

influxd run -config /etc/influxdb.conf