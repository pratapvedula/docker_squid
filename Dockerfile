FROM centos:latest

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN   useradd proxy && mkdir /var/spool/squid && mkdir /var/log/squid && chmod -R 755 /var/spool/squid && chmod -R 755 /var/log/squid && chown -R proxy:proxy /var/spool/squid && chown -R proxy:proxy /var/log/squid  && yum -y  update \
 &&  yum   install -y which squid

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
