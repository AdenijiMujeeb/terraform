FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl

RUN curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz \
    && tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz \
    && mv node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-1.2.2.linux-amd64*

EXPOSE 9100

CMD [ "/usr/local/bin/node_exporter" ]
