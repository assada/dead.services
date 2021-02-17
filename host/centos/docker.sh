#!/bin/bash

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo


yum install -y docker-ce docker-ce-cli containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker -v
docker-compose -v
