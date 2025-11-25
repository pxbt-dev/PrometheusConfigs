FROM prom/prometheus:v2.47.0

# Disable the problematic query log that causes permission issues
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--query-log-file="]

# Fix permission issues
USER nobody

# Add cache busting
ARG CACHE_BUST=1
RUN echo "Cache bust: $CACHE_BUST"

COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY global/alert-rules.yml /etc/prometheus/
COPY applications/ /etc/prometheus/applications/