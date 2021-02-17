#!/bin/bash

docker run \
    -d \
    --restart=always \
    -p 9090:9090 \
    -v "$(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml" \
    -v prometheus:/prometheus \
    --name=prometheus \
    prom/prometheus
