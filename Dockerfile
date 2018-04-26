FROM ubuntu:latest
MAINTAINER steer629

#ENV DEBIAN_FRONTEND noninteractive


# built-in packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common curl\
    && apt-get install -y --no-install-recommends --allow-unauthenticated  apt-utils \
        python3 python3-pip python3-dev build-essential \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip 
RUN pip3 install setuptools
RUN pip3 install Flask

EXPOSE 5000





