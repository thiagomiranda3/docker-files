#!/bin/bash

docker container kill "${PWD##*/}" 2> /dev/null
docker container rm -f "${PWD##*/}" 2> /dev/null

docker run \
        --name="${PWD##*/}" \
        --hostname="${PWD##*/}" \
        -e discovery.type=single-node \
        -e action.auto_create_index=true \
        -e xpack.ml.enabled=false \
	--log-opt max-size=100m \
	--log-opt max-file=10 \
        -v ${PWD}/data:/data/elk \
        -p 9200:9200 \
        -p 9300:9300 \
        -d "${PWD##*/}"
