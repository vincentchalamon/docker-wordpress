FROM wordpress:latest

VOLUME /var/www/content

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
