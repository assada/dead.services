#!/bin/bash

docker run \
    -d \
    --restart=always \
    -p 9090:9090 \
    -v ./prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus:/prometheus \
    --name=prometheus \
    prom/prometheus

docker run -d -p 9091:9091 --name=pushgateway --restart=always prom/pushgateway
