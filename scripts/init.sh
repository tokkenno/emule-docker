#!/bin/sh

EMULE_USERNAME=${EMULE_USERNAME:-"https:\/\/emule-project.net"}
EMULE_MAX_CONNECTIONS=${EMULE_MAX_CONNECTIONS:-"3500"}
EMULE_TCP_PORT=${EMULE_TCP_PORT:-"23732"}
EMULE_UDP_PORT=${EMULE_UDP_PORT:-"23733"}
EMULE_DOWNLOAD_CAPACITY=${EMULE_DOWNLOAD_CAPACITY:-"10000000"}
EMULE_UPLOAD_CAPACITY=${EMULE_UPLOAD_CAPACITY:-"10000000"}
EMULE_AUTOCONNECT=${EMULE_AUTOCONNECT:-"1"}
EMULE_BUFFER_SIZE=${EMULE_BUFFER_SIZE:-"1572864"}
EMULE_WEB_ENABLED=${EMULE_WEB_ENABLED:-"1"}
EMULE_WEB_PASSWORD=${EMULE_WEB_PASSWORD:-"19A2854144B63A8F7617A6F225019B12"}

BASE_PATH="/app/config"
PREFERENCES_PATH="${BASE_PATH}/preferences.ini"
PREFERENCES_PATH_BAK="${PREFERENCES_PATH}.bak"

if [ -f "$PREFERENCES_PATH" ]; then
    echo "Applying configuration..."
    cp -f $PREFERENCES_PATH $PREFERENCES_PATH_BAK
    # sed "s/Nick=.*$/Nick=${EMULE_USERNAME}/; s/MaxConnections=.*$/MaxConnections=${EMULE_MAX_CONNECTIONS}/; s/^Port=.*$/Port=${EMULE_TCP_PORT}/; s/^UDPPort=.*$/UDPPort=${EMULE_UDP_PORT}/; s/^DownloadCapacity=.*$/DownloadCapacity=${EMULE_DOWNLOAD_CAPACITY}/; s/^UploadCapacityNew=.*$/UploadCapacityNew=${EMULE_UPLOAD_CAPACITY}/; s/^Autoconnect=.*$/Autoconnect=${EMULE_AUTOCONNECT}/; s/^FileBufferSize=.*$/FileBufferSize=${EMULE_BUFFER_SIZE}/; s/^Enabled=.*$/Enabled=${EMULE_WEB_ENABLED}/; s/^Password=.*$/Password=${EMULE_WEB_PASSWORD}/" ${PREFERENCES_PATH_BAK} > ${PREFERENCES_PATH}

    echo "Running services..."
    /usr/bin/supervisord
else
    echo "Emule configuration file not found. Shutting down..."
fi