#!/bin/sh

mkdir -p /etc/nginx/ssl /run/nginx

openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mrouabeh/CN=localhost"

adduser -D "admin"
echo "admin:admin" | chpasswd


openrc
touch /run/openrc/softlevel
rc-update add sshd
/etc/init.d/sshd start

telegraf &
nginx -g "daemon off;"