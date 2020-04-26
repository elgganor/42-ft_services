mkdir -p /var/www/localhost/
wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
rm -rf latest.tar.gz
mv ./wordpress /var/www/localhost

php -S 0.0.0.0:5050 -t /var/www/localhost/wordpress