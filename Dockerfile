FROM haproxy:alpine

MAINTAINER AaronLuellwitz <aaron.luellwitz@gmx.de>

RUN mkdir /run/haproxy/
RUN mkdir -p /app/logs/
RUN chmod 777 /app/logs
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

CMD ["haproxy", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

EXPOSE 80 9999
