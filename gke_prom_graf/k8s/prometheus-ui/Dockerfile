FROM prom/prometheus:v2.30.3
COPY requirements.txt /tmp/
RUN apk add --no-cache -U curl && \
    apk add --no-cache --virtual .build-deps gcc musl-dev && \
    pip3 install --no-cache-dir -r /tmp/requirements.txt && \
    apk del .build-deps

# COPY prometheus.yml /etc/prometheus/prometheus.yml
