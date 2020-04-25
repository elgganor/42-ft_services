mkdir -p /etc/nginx/ssl /run/nginx

openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mrouabeh/CN=localhost"

nginx -g "daemon off;"