FROM ubuntu:bionic
MAINTAINER Aitor González


ENV UID 0
ENV GUI 0
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV EMULE_USERNAME https://emule-project.net
ENV EMULE_MAX_CONNECTIONS 3500
ENV EMULE_TCP_PORT 23732
ENV EMULE_UDP_PORT 23733

WORKDIR /root

RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get -y install unzip wget tar curl gnupg software-properties-common xvfb xdotool supervisor net-tools fluxbox

ENV WINEDLLOVERRIDES=mscoree=d;mshtml=d
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
    apt-key add winehq.key && \
    apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
    apt-get -y install winehq-stable

WORKDIR /app

RUN curl https://files.emule-project.net/eMule0.51d.zip --output /tmp/emule.zip && \
    unzip /tmp/emule.zip -d /tmp && mv /tmp/eMule0.51d/* /app

ENV WINEPREFIX /app/.wine
ENV WINEARCH win32
ENV DISPLAY :0
    
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY scripts /app
COPY config/emule /app/config

EXPOSE 4711/tcp 23732/tcp 23733/udp
VOLUME /app/config /data

ENTRYPOINT ["/app/init.sh"]
