FROM alpine:edge

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing librespot

ENV SPOTIFY_NAME=Docker
ENV SPOTIFY_DEVICE=/data/fifo
ENV INIT_VOLUME=100
ENV CACHE_DIR=/data/cache
ENV BITRATE=320
ENV ZEROCONF_PORT=5353

CMD librespot \
    --backend pipe \
    --bitrate "$BITRATE" \
    --cache "$CACHE_DIR$" \
    --device "$SPOTIFY_DEVICE" \
    --enable-oauth \
    --initial-volume "$INIT_VOLUME" \
    --name "$SPOTIFY_NAME" \
    --zeroconf-port "$ZEROCONF_PORT"
