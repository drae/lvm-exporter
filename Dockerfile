FROM golang:1.26

RUN apt-get update || exit 0
RUN apt-get install -y lvm2

# renovate: datasource=github-tags depName=hansmi/prometheus-lvm-exporter
RUN go install github.com/hansmi/prometheus-lvm-exporter@v0.6.2

ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

EXPOSE 9845
CMD ["prometheus-lvm-exporter", "--command=/sbin/lvm"]
