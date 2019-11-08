# emule-docker
Emule over wine, "daemonized" inside a docker

`docker run -p 4711:4711 -p 23732:23732 -p 23733:23733 -v emule_data:/data --name emule emule`

## Environment variables

- **UID:** UNIX user ID used to create files (Default: `root`)
- **GID:** UNIX group ID used to create files (Default: `root`)
- **EMULE_NICK:** User nickname (Default: `https://emule-project.net`)
- **EMULE_MAX_UPLOAD:** Max upload speed (Default: `50000`, 50Mbps)
- **EMULE_TCP_PORT:** TCP port (Default: `23732`)
- **EMULE_UDP_PORT:** TCP port (Default: `23733`)
- **EMULE_LANGUAGE:** UI language code. (Default: `1033`)
- **EMULE_CAP_UPLOAD:** Upload capacity (Default: `1000000`, 1Gbps)
- **EMULE_CAP_DOWNLOAD:** Download capacity (Default: `1000000`, 1Gbps)
- **EMULE_RECONNECT:** Automatic reconnect (Default: `1`)
- **EMULE_UPDATE_FROM_SERVER:** Update server list from other servers (Default: `1`)
- **EMULE_HOSTNAME:** Server hostname (Default: )
- **WEB_PASS:** Web UI password hash (Default: `19A2854144B63A8F7617A6F225019B12`, admin)
- **WEB_PORT:** Web UI port (Default: `4711`)

## Ports

- `4711/tcp`: Web control panel
- `23732/tcp`: Edonkey network
- `23733/udp`: Kad network

## Volumes

- `/data/download`: Complete downloads
- `/data/tmp`: Incomplete downloads