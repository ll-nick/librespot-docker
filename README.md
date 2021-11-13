[![](https://images.microbadger.com/badges/image/kevineye/librespot.svg)](https://microbadger.com/images/kevineye/librespot "Get your own image badge on microbadger.com")

This container runs a headless [Spotify](https://www.spotify.com/us/) player that can be remote-controlled by any Spotify app. Audio is output to a pipe, which can be consumed in another container or the host system by [alsa](http://www.alsa-project.org/), [pulseaudio](http://pulseaudio.org), [forked-daapd](https://ejurgensen.github.io/forked-daapd/) (to Airplay), [snapserver](https://github.com/badaix/snapcast), etc.

This requires a Spotify premium account, but does not require a Spotify developer key or libspotify binary.

The process run is [librespot](https://github.com/plietar/librespot), an open source client library for Spotify.

Check [my meta repository](https://github.com/ll-nick/jukebox-meta) for a docker-compose file to run this docker image.
