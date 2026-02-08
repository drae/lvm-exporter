# LVM Exporter Docker Container

A simple Docker container that packages the [prometheus-lvm-exporter](https://github.com/hansmi/prometheus-lvm-exporter) for monitoring Linux LVM with Prometheus.

## What does it do?

This container runs a Prometheus exporter that collects metrics from your system's LVM setup - things like volume group sizes, logical volume usage, and physical volume health. It's handy if, like me, you're running LVM on your server and want to monitor storage health.

## Quick Start

```bash
# Pull and run the container
docker run -d \
  --name lvm-exporter \
  --privileged \
  -v /run/lvm:/run/lvm:ro \
  -v /etc/lvm:/etc/lvm:ro \
  -p 9845:9845 \
  ghcr.io/drae/lvm-exporter:latest
```

## Prometheus Configuration

```yaml
scrape_configs:
  - job_name: 'lvm-exporter'
    static_configs:
      - targets: ['localhost:9845']
```
