# BASE IMAGE
FROM debian:buster

# NGINX, MYSQL
RUN		apt-get update && apt-get -y upgrade \
		nginx \
		mariadb-server

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

COPY	src/start.sh .
CMD		bash start.sh
