#!/bin/bash
docker run -d --name=telegraf --net=dead-services -p 8125:8125/udp -p 9273:9273 --restart=always -v ./telegraf.conf:/etc/telegraf/telegraf.conf:ro telegraf

docker run -d --name=influxdb --net=dead-services -p 8086:8086 --restart=always influxdb
