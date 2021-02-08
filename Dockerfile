# BASE IMAGE
FROM debian:buster

# NGINX, MYSQL
RUN		apt-get update && apt-get -y upgrade &&\
		apt-get -y install php7.3 php-fpm php-mysql php-mbstring php-pdo php-gd php-cli \
		nginx \
		mariadb-server \
		openssl

# PHPMYADMIN
ADD		https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar
RUN		tar -xf phpmyadmin.tar &&\
		rm phpmyadmin.tar &&\
		mv  phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

# WORDPRESS
ADD		https://ru.wordpress.org/latest-ru_RU.tar.gz wordpress.tar.gz
RUN		tar -xf wordpress.tar.gz &&\
		rm wordpress.tar.gz &&\
		mv  wordpress /var/www/html/wordpress
# SSL
RUN		openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=/L=/O=/OU=42moscow/CN=mharriso" \
		-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

COPY	srcs/*.sh .
COPY	srcs/default /etc/nginx/sites-available
COPY	srcs/autoindex_off /etc/nginx/sites-available
COPY	srcs/config.inc.php /var/www/html/phpmyadmin
COPY	srcs/wp-config.php /var/www/html/wordpress
RUN		chmod 660 /var/www/html/wordpress/wp-config.php

# Giving nginx's user-group rights over page files
RUN		chown -R www-data:www-data /var/www/html/*

CMD		bash start.sh
