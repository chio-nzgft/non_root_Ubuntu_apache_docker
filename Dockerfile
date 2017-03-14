FROM ubuntu:16.04
RUN apt-get update && apt -y dist-upgrade
RUN apt install -y apache2 
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/apache2
RUN /etc/init.d/apache2 stop
RUN chown -R www-data: /var/www/html
RUN chown -R www-data: /var/log/apache2/
RUN chown -R www-data: /var/run/apache2/
RUN mkdir /home/www-data
RUN chown -R www-data /home/www-data
EXPOSE 8080
USER www-data
RUN echo "#!/bin/bash" > /home/www-data/start.sh
RUN echo "/usr/sbin/apache2ctl start" >> /home/www-data/start.sh
RUN echo "while true; do" >> /home/www-data/start.sh
RUN echo "sleep 5" >> /home/www-data/start.sh
RUN echo "done" >> /home/www-data/start.sh
RUN chmod +x /home/www-data/start.sh
ENTRYPOINT /home/www-data/start.sh
