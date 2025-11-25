FROM prom/prometheus:v2.47.0

# Add cache busting
ARG CACHE_BUST=1
RUN echo "Cache bust: $CACHE_BUST"

COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY global/alert-rules.yml /etc/prometheus/
COPY applications/ /etc/prometheus/applications/