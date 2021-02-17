#!/bin/bash
docker run -d --name=influxdb --net=dead-services -p 8086:8086 --restart=always influxdb
