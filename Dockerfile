FROM golang:1.12 as builder

WORKDIR /usr/src/prometheus-example-app
COPY go.mod go.sum ./
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -v -o prometheus-example-app main.go

FROM busybox:1
COPY --from=builder /usr/src/prometheus-example-app/prometheus-example-app .
EXPOSE 8080
ENTRYPOINT ["./prometheus-example-app"]
