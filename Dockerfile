FROM alpine:edge

WORKDIR /data

RUN apk -U add curl cargo portaudio-dev protobuf-dev libgcc \
 && cd /root \
 && curl -LO https://github.com/librespot-org/librespot/archive/master.zip \
# && curl -LO https://github.com/dawidd6/librespot/archive/master.zip \
 && unzip master.zip \
 && cd librespot-master \
 && cargo build --jobs $(grep -c ^processor /proc/cpuinfo) --release --no-default-features \
 && mv target/release/librespot /usr/local/bin \
 && mkfifo /data/fifo \
 && cd / \
 && apk --purge del curl cargo portaudio-dev protobuf-dev \
 && apk add llvm-libunwind \
 && rm -rf /etc/ssl /var/cache/apk/* /lib/apk/db/* /root/master.zip /root/librespot-master /root/.cargo


ENV SPOTIFY_NAME Docker
ENV SPOTIFY_DEVICE /data/fifo
ENV INIT_VOLUME 100

CMD librespot -n "$SPOTIFY_NAME" --device "$SPOTIFY_DEVICE" -b 320 --zeroconf-port 5353 --initial-volume $INIT_VOLUME
