from nginx:alpine

copy ./public /var/www
copy ./nginx.conf /etc/nginx/conf.d/default.conf

workdir /var/www