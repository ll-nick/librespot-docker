#!/bin/bash

docker run --rm --name librespot -p 5353:5353 -v /tmp/librespot:/data -e SPOTIFY_NAME=Snapcast -e SPOTIFY_USER=<user> -e SPOTIFY_PASSWORD=<pw> nickll/librespot
