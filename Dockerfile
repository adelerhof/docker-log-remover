# Dockerfile to create image with cron services
FROM ubuntu:latest
LABEL org.opencontainers.image.authors="blaataap"

# Add the script to the Docker Image
ADD remove-files.sh /root/remove-files.sh
ADD remove-files-completely.sh /root/remove-files-completely.sh

# Give execution rights on the cron scripts
RUN chmod 0755 /root/remove-files.sh
RUN chmod 0755 /root/remove-files-completely.sh

#Install Cron
RUN apt-get update && apt-get install -y cron \
    bash \
    bash-completion \
    ca-certificates \
    rsyslog \
    vim
COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab && crontab /etc/cron.d/crontab

CMD cron && touch /var/log/cron.log && tail -F /var/log/cron.log