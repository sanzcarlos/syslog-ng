# Version: 3.8.1

# Establece la imagen de base a utilizar para debian
FROM debian:stable-slim

MAINTAINER Carlos Sanz <carlos.sanzpenas@gmail.com>

LABEL vendor=Personal \ 
      com.example.is-beta= \
      com.example.is-production="" \
      com.example.version="3.8.1" \
      com.example.release-date="2016-11-30"

RUN apt-get update -qq && \
    apt-get dist-upgrade -y -qq && \
    apt-get install -y \
    wget \
    gnupg \
    gnupg1 \
    gnupg2 && \
    wget -qO - http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0/Release.key | apt-key add - && \
    echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list && \ 
    apt-get update -qq && \
    apt-get install -y \
    syslog-ng && \
    apt-get remove -y wget \
    gnupg \
    gnupg1 \
    gnupg2 && \
    apt-get autoremove -y -qq && \
    apt-get autoclean -y -qq && \
    rm -rf /var/lib/apt/lists/* 

ADD https://raw.githubusercontent.com/sanzcarlos/syslog-ng/master/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

EXPOSE 514/udp
EXPOSE 601/tcp
# EXPOSE 6514/tcp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
