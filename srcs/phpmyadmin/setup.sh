mkdir -p /var/www/localhost/

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
tar xzvf phpMyAdmin-4.9.5-all-languages.tar.gz
mv phpMyAdmin-4.9.5-all-languages /var/www/localhost/phpmyadmin
rm -rf phpMyAdmin-4.9.5-all-languages.tar.gz
mv /tmp/config.inc.php /var/www/localhost/phpmyadmin

telegraf &
php -S 0.0.0.0:5000 -t /var/www/localhost/phpmyadmin