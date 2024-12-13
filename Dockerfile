FROM golang:1.18-bullseye

RUN apt-get update || exit 0
RUN apt-get install -y lvm2

RUN go install github.com/hansmi/prometheus-lvm-exporter@latest

ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

EXPOSE 9845
CMD ["prometheus-lvm-exporter"]
