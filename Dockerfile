FROM ubuntu:16.04

MAINTAINER Erik Kaareng-Sunde <erik@eriksunde.com>

ENV DEBIAN_FRONTEND noninteractive

RUN adduser --home /srv/mosquitto --gecos "" --no-create-home --UID 4096 --disabled-password mosquitto

RUN apt-get update ; apt-get install -y build-essential libwrap0-dev libssl-dev libc-ares-dev uuid-dev xsltproc wget ; apt-get clean

RUN mkdir -p /srv/mosquitto/

WORKDIR /srv/mosquitto
RUN wget http://mosquitto.org/files/source/mosquitto-1.4.11.tar.gz
RUN tar zxvf mosquitto-1.4.11.tar.gz
RUN cd mosquitto-1.4.11 && make && make install

RUN mkdir /var/lib/mosquitto/

ADD conf /etc/mosquitto
RUN chown mosquitto:mosquitto -R /var/lib/mosquitto/

COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN /sbin/ldconfig
EXPOSE 1883

USER mosquitto

CMD ["/start.sh"]
