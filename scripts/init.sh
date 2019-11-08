#!/bin/sh

if [ -f "/data/download" ]; then
    echo "Creating download directory..."
    mkdir -p /data/download
fi

if [ -f "/data/tmp" ]; then
    echo "Creating tmp directory..."
    mkdir -p /data/tmp
fi

if [ $UID != "0" ]; then
    echo "Fixing permissions..."
    useradd --shell /bin/bash -u ${UID} -U -d /app -s /bin/false emule && \
    usermod -G users emule
    chown -R ${UID}:${GID} /data
    chown -R ${UID}:${GID} /app
fi

echo "Applying configuration..."
/app/launcher

echo "Running services..."
/usr/bin/supervisord