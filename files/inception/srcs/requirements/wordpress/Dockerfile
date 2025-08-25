FROM debian:bookworm-20250811-slim

RUN apt update -y && apt upgrade -y \
&& apt install -y php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    mariadb-client \
    wget \
    curl \
    bash \
&& wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www/html \
&& cd /var/www/html \
&& tar -xzf wordpress-6.1.1-fr_FR.tar.gz \
&& rm wordpress-6.1.1-fr_FR.tar.gz

COPY /conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY /conf/wp-config.php /var/www/html/wordpress/wp-config.php
COPY /conf/script.sh /script.sh

RUN chmod a+x /script.sh

EXPOSE 9000

ENTRYPOINT ["/script.sh"]

CMD ["/usr/sbin/php8.2-fpm", "--nodaemonize"]
