#!/bin/bash

docker container kill "${PWD##*/}" 2> /dev/null
docker container rm -f "${PWD##*/}" 2> /dev/null

docker run \
        --name="${PWD##*/}" \
        --hostname="${PWD##*/}" \
        -p 5672:5672 \
        -p 15672:15672 \
	--restart unless-stopped \
	--log-opt max-size=100m \
	--log-opt max-file=10 \
        -e RABBITMQ_DEFAULT_USER=admin \
        -e RABBITMQ_DEFAULT_PASS=123456 \
        -v ${PWD}/rabbitmq-data:/var/lib/rabbitmq \
        -d "${PWD##*/}"