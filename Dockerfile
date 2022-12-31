FROM alpine:edge

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing librespot

ENV SPOTIFY_NAME Docker
ENV SPOTIFY_DEVICE /data/fifo
ENV INIT_VOLUME 100

CMD librespot -n "$SPOTIFY_NAME" -u "$SPOTIFY_USER" -p "$SPOTIFY_PASSWORD" --backend pipe --device "$SPOTIFY_DEVICE" -b 320 --zeroconf-port 5353 --initial-volume "$INIT_VOLUME"
