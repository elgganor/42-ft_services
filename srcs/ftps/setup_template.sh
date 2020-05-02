openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mrouabeh/CN=localhost"

adduser -D "admin"
echo "admin:admin" | chpasswd

/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P MINIKUBE_IP