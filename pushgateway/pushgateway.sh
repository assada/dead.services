#!/bin/bash

docker run -d -p 9091:9091 --name=pushgateway --restart=always prom/pushgateway
