#!/bin/bash

docker run -d \
  --restart=always \
  --name=filebeat \
  --user=root \
  --network="dead-services" \
  --volume="$(pwd)/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  docker.elastic.co/beats/filebeat:7.6.2 filebeat -e -strict.perms=false \
  -E output.elasticsearch.hosts=["elasticsearch:9200"] \
  -E output.elasticsearch.username="elastic" \
  -E output.elasticsearch.password="secret"
