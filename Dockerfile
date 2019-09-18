FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install unzip xvfb x11vnc xdotool wget tar supervisor wine32-development net-tools fluxbox curl
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0

WORKDIR /app
COPY scripts /app
RUN curl https://files.emule-project.net/eMule0.51d.zip --output /tmp/emule.zip && \
    unzip /tmp/emule.zip -d /tmp && mv /tmp/eMule0.51d/* /app
COPY config/emule /app/config
RUN mkdir /data && mkdir /data/download && mkdir /data/tmp

ENV EMULE_USERNAME https://emule-project.net
ENV EMULE_MAX_CONNECTIONS 3500
ENV EMULE_TCP_PORT 23732
ENV EMULE_UDP_PORT 23733

EXPOSE 4711/tcp 23732/tcp 23733/udp

CMD ["/app/init.sh"]
