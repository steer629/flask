FROM ubuntu:latest
MAINTAINER steer629

#ENV DEBIAN_FRONTEND noninteractive


# built-in packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common curl\
    && apt-get install -y --no-install-recommends --allow-unauthenticated  apt-utils \
        python3 python3-pip python3-dev build-essential lynx python3-psycopg2\
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip 
RUN pip3 install setuptools
RUN pip3 install Flask
RUN pip3 install flask-sqlalchemy flask-script flask-bootstrap flask-mail flask-wtf pandas virtualenv psycopg2-binary

RUN alias python=python3

EXPOSE 5000






