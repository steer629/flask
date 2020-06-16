FROM ubuntu:latest
MAINTAINER steer629

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates sudo procps git \
    python3 python3-bcrypt python3-levenshtein python3-pydot python3-psycopg2 ssl-cert python3-xlwt pip3 \
    vim unoconv wget
    
RUN wget -O - https://nightly.odoo.com/odoo.key | apt-key add - \
    && echo "deb http://nightly.odoo.com/13.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list \
    
RUN apt-get update && apt-get install -y --no-install-recommends odoo \
    && rm -rf /var/lib/apt/lists/*

#RUN pip3 install

CMD ["bash"]

