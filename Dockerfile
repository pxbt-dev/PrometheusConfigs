FROM prom/prometheus:v2.47.0

# Create a writable directory for Prometheus
RUN mkdir -p /prometheus_data && chown -R 65534:65534 /prometheus_data

# Use the custom data directory
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus_data"]

COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY global/alert-rules.yml /etc/prometheus/
COPY applications/ /etc/prometheus/applications/