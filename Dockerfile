FROM haproxy:alpine

ENV STATE=haproxy

MAINTAINER AaronLuellwitz <aaron.luellwitz@gmx.de>

RUN mkdir /run/haproxy/
RUN mkdir -p /app/logs/
RUN chmod 777 /app/logs
COPY ./*.cfg /usr/local/etc/haproxy/

CMD haproxy -db -f /usr/local/etc/haproxy/${STATE}.cfg

EXPOSE 80 8443
