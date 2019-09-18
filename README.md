# emule-docker
Emule over wine, "daemonized" inside a docker

`docker run -p 4711:4711 -p 23732:23732 -p 23733:23733 -v emule_data:/data --name emule emule`

## Ports

- `4711/tcp`: Web control panel
- `23732/tcp`: Edonkey network
- `23733/udp`: Kad network

## Volumes

- `/data/download`: Complete downloads
- `/data/tmp`: Incomplete downloads