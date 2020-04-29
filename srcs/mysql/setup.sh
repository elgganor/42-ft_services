mkdir -p /run/mysqld

mysql_install_db --user=root

echo -ne "FLUSH PRIVILEGES;\n
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;\n
FLUSH PRIVILEGES;\n" >> tmp_mysql

/usr/bin/mysqld --user=root --bootstrap < tmp_mysql

exec /usr/bin/mysqld --user=root