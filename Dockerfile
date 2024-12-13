FROM golang:1.23-bullseye

RUN go install github.com/hansmi/prometheus-lvm-exporter@latest

ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

EXPOSE 9845
CMD ["prometheus-lvm-exporter"]
