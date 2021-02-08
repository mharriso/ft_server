mv	/etc/nginx/sites-available/default /etc/nginx/sites-available/autoindex_off
mv	/etc/nginx/sites-available/autoindex_on /etc/nginx/sites-available/default
nginx -s reload
