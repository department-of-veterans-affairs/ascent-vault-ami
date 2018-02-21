#!/bin/bash -ex

cd /apps/prometheus/

curl -LO "https://github.com/prometheus/statsd_exporter/releases/download/v0.6.0/statsd_exporter-0.6.0.linux-amd64.tar.gz"

tar -xvf statsd_exporter-0.6.0.linux-amd64.tar.gz

rm -rf statsd_exporter-0.6.0.linux-amd64.tar.gz

sudo cp /tmp/prometheus_statsd_exporter.service /usr/lib/systemd/system/prometheus_statsd_exporter.service

sudo systemctl enable prometheus_statsd_exporter.service

sudo systemctl start prometheus_statsd_exporter.service
