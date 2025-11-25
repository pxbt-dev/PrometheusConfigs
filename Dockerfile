FROM prom/prometheus:v2.47.0
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY global/alert-rules.yml /etc/prometheus/
COPY applications/ /etc/prometheus/applications/