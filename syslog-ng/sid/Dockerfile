# Version: 3.13.2

FROM debian:sid-slim

MAINTAINER Carlos Sanz <carlos.sanzpenas@gmail.com>

LABEL org.label-schema.vendor = "Personal" \
      org.label-schema.name = "Syslog-NG" \
      org.label-schema.version = "3.13.2-sid" \
      org.label-schema.docker.cmd = "docker run -p 514:514 sanzcarlos/syslog-ng:3.13.2-sid" \
      org.label-schema.name = "Syslog-NG" \
      org.label-schema.build-date = "2018-01-08"

RUN apt-get update -qq && \
    apt-get dist-upgrade -y -qq && \
    apt-get install -y syslog-ng && \
    apt-get autoremove -y -qq && \
    apt-get autoclean -y -qq && \
    rm -rf /var/lib/apt/lists/* 

ADD syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

EXPOSE 514/udp
EXPOSE 601/tcp
# EXPOSE 6514/tcp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
