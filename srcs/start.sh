#!/bin/bash

service mysql start
service php7.3-fpm start
service nginx start

# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

# echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u mharriso --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'mharriso'@'localhost';" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
bash
