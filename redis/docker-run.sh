#!/bin/bash

docker container kill "${PWD##*/}" 2> /dev/null
docker container rm -f "${PWD##*/}" 2> /dev/null

docker run \
        --name="${PWD##*/}" \
        -p 6379:6379 \
	--log-opt max-size=100m \
	--log-opt max-file=10 \
        -d "${PWD##*/}"
