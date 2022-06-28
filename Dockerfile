# Dockerfile to create image with cron services
FROM ubuntu:latest
LABEL org.opencontainers.image.authors="blaataap"


# Add the script to the Docker Image
ADD remove-files.sh /root/remove-files.sh

# Give execution rights on the cron scripts
RUN chmod 0744 /root/remove-files.sh

#Install Cron
RUN apt-get update && apt-get install -y cron \
    bash \
    bash-completion \
    ca-certificates \
    vim
COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab && crontab /etc/cron.d/crontab

ENTRYPOINT bash