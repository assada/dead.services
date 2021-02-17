#!/bin/bash

docker volume create grafana-storage

docker run -d --restart=always --name=grafana-renderer --network=dead-services grafana/grafana-image-renderer:latest

docker run \
  -d \
  --restart=always \
  -p 3000:3000 \
  --name=grafana \
  --label caddy.address="grafana.dead.services" \
  --label caddy.tls="assada.ua@gmail.com" \
  --label caddy.targetport=3000 \
  --network dead-services \
  -v grafana-storage:/var/lib/grafana \
  -e "GF_RENDERING_SERVER_URL=http://grafana-renderer:8081/render" \
  -e "GF_RENDERING_CALLBACK_URL: https://grafana.dead.services/" \
  -e "GF_INSTALL_PLUGINS=grafana-github-datasource,ryantxu-ajax-panel,simpod-json-datasource,marcusolsson-json-datasource,digiapulssi-breadcrumb-panel,yesoreyeram-boomtable-panel,grafana-clock-panel,grafana-simple-json-datasource,grafana-piechart-panel,novalabs-annotations-panel,vonage-status-panel,fetzerch-sunandmoon-datasource,natel-discrete-panel,natel-influx-admin-panel" \
  grafana/grafana
