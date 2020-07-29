#!/bin/bash

docker logs "${PWD##*/}" -f --tail 200
