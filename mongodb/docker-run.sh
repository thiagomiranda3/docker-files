#!/bin/bash

docker container kill "${PWD##*/}" 2> /dev/null
docker container rm -f "${PWD##*/}" 2> /dev/null

docker run --name="${PWD##*/}" \
    -p 27017:27017 \
    --restart unless-stopped \
    -v ${PWD}/data/db:/data/db \
    --log-opt max-size=100m \
    --log-opt max-file=10 \
    -d "${PWD##*/}"
