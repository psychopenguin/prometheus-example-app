VERSION=v0.1.0

all:
	docker build -t psychopenguin/prometheus-example-app:$(VERSION) .
