FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_PID_FILE /var/run/apache2.pid
RUN echo "Listen 8080" > /etc/apache2/ports.conf
RUN chown -R www-data:www-data /var/log/apache2


EXPOSE 8080

USER www-data
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
