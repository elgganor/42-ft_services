mkdir -p /var/www/localhost/
wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
mv ./wordpress /var/www/localhost
rm -rf latest.tar.gz
mv /tmp/wp-config.php /var/www/localhost/wordpress

php -S 0.0.0.0:5050 -t /var/www/localhost/wordpress