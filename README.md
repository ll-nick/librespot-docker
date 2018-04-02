[![](https://images.microbadger.com/badges/image/kevineye/librespot.svg)](https://microbadger.com/images/kevineye/librespot "Get your own image badge on microbadger.com")

This container runs a headless [Spotify](https://www.spotify.com/us/) player that can be remote-controlled by any Spotify app. Audio is output to a pipe, which can be consumed in another container or the host system by [alsa](http://www.alsa-project.org/), [pulseaudio](http://pulseaudio.org), [forked-daapd](https://ejurgensen.github.io/forked-daapd/) (to Airplay), [snapserver](https://github.com/badaix/snapcast), etc.

This requires a Spotify premium account, but does not require a Spotify developer key or libspotify binary.

The process run is [librespot](https://github.com/plietar/librespot), an open source client library for Spotify.

### Examples

Play audio to /tmp/spotify-pipe:

    docker run -d \
        -v /tmp/spotify-pipe:/data/fifo
        -e SPOTIFY_NAME=Docker \
        -e SPOTIFY_USER=... \
        -e SPOTIFY_PASSWORD=... \
        kevineye/librespot

### docker-compose:

version: "2"

```yaml
services:
  snapserver:
    container_name: snapserver
    restart: always
    volumes:
      - /tmp/snapcastfifo:/data/spotify
      - ./snapcast:/root/.config/snapserver
    image: kevineye/snapcast
    command: "snapserver -s pipe:///data/spotify/fifo?name=Spotify&sampleformat=44100:16:2"
    ports:
      - "1704:1704"
      - "1705:1705"
  airplay:
    container_name: airplay
    restart: always
    image: kevineye/shairport-sync
    network_mode: host
    volumes:
      - /tmp/snapcastfifo:/output
    command: "-o pipe -- /output"

  spotify:
    container_name: spotify
    restart: always
    image: gronis/librespot
    volumes:
      - /tmp/snapcastfifo:/data
    environment:
      SPOTIFY_NAME: "Multiroom"
      SPOTIFY_USER: "YourSpotifyUsername"
      SPOTIFY_PASSWORD: "YourSpotifyPassword"
```
