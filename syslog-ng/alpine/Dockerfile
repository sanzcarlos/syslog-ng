FROM alpine:3.8

MAINTAINER Carlos Sanz <carlos.sanzpenas@gmail.com>

LABEL org.label-schema.vendor = "Personal" \
      org.label-schema.name = "Syslog-NG" \
      org.label-schema.version = "3.9-alpine" \
      org.label-schema.docker.cmd = "docker run -p 514:514 sanzcarlos/syslog-ng:3.9-alpine" \
      org.label-schema.name = "Syslog-NG" \
      org.label-schema.build-date = "2018-08-29"

RUN apk update && \
    apk upgrade && \
    apk add syslog-ng

ADD https://raw.githubusercontent.com/sanzcarlos/syslog-ng/master/syslog-ng/alpine/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
