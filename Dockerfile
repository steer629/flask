
FROM tryton/tryton:5.6
LABEL org.label-schema.version="5.6-office"

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       vim su \
    && rm -rf /var/lib/apt/lists/*

USER trytond
