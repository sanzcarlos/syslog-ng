# Version: 0.1

# Establece la imagen de base a utilizar para debian
FROM debian:testing-slim

MAINTAINER Carlos Sanz <carlos.sanzpenas@gmail.com>

LABEL vendor=Personal \ 
      com.example.is-beta= \
      com.example.is-production="" \
      com.example.version="0.0.1" \
      com.example.release-date="2016-11-30"

RUN apt-get update -qq && \
    apt-get dist-upgrade -y -qq && \
    apt-get install -y \
    wget \
    gnupg \
    gnupg1 \
    gnupg2 && \
    wget -qO - http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0/Release.key | apt-key add - && \
    echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list && \ 
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

# COPY syslog-ng.conf /etc/syslog-ng/

EXPOSE 514/udp
EXPOSE 601
EXPOSE 6514

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
