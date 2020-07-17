
FROM tryton/tryton:5.6
LABEL tryton/tryton:latest

COPY trytond.conf /etc/trytond.conf

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       vim gosu \
    && rm -rf /var/lib/apt/lists/*

USER trytond
