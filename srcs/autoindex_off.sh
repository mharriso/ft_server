mv	/etc/nginx/sites-available/default /etc/nginx/sites-available/autoindex_on
mv	/etc/nginx/sites-available/autoindex_off /etc/nginx/sites-available/default
nginx -s reload
