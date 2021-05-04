FROM alpine

MAINTAINER Daniel Guerra

RUN  apk update \
  && apk add openldap \
  && rm -rf /var/cache/apk/*

EXPOSE 389

VOLUME ["/etc/openldap-dist", "/var/lib/openldap"]

COPY modules/ /etc/openldap/modules

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["slapd", "-d", "32768", "-u", "ldap", "-g", "ldap"]
