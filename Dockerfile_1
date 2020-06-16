FROM ubuntu:latest
MAINTAINER steer629

#ENV DEBIAN_FRONTEND noninteractive


# Set Tryton major variable for reuse
ENV T_DIST bullseye
ENV T_MAJOR 5.0

# Setup environment and UTF-8 locale
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

# Use a local cache
#RUN echo 'Acquire::http { Proxy "http://apt-cacher:9999"; };' >> /etc/apt/apt.conf.d/01proxy

# Do not use Recommends (otherwise Tryton packages will install postgresql)
# Use gosu for easy step-down from root
# Add key and sources for debian.tryton.org
RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		ca-certificates \
		gosu \
		sudo \
		procps \
		git \
#	&& curl -o /etc/apt/trusted.gpg.d/debian.tryton.org-archive.gpg -SL "https://debian.m9s.biz//debian/debian.tryton.org-archive.gpg" \
#	&& curl -o /etc/apt/sources.list.d/tryton-$T_DIST-$T_MAJOR.list https://debian.m9s.biz/debian/tryton-$T_DIST-$T_MAJOR.list \
#	&& curl -o /etc/apt/preferences.d/debian.tryton.org.pref -SL "https://debian.m9s.biz/debian/debian.tryton.org.pref" \
	&& apt-get purge -y --auto-remove 

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
# Install additional distribution packages
# Add vim for easy edit
RUN apt-get update && apt-get install -y --no-install-recommends \
	python3-bcrypt \
	python3-levenshtein \
	python3-pydot \
	python3-psycopg2 \
	ssl-cert \
	tryton-server \
	vim \
	unoconv \
	&& rm -rf /var/lib/apt/lists/*
	
#install sao
#RUN npm install tryton-sao

# Default environment for the server
ENV TRYTOND_CONFIG=/etc/tryton/trytond.conf
ENV TRYTOND_DATABASE_URI=postgresql://
ENV TRYTOND_DATA=/var/lib/tryton

# Add a directory to process setup scripts for the container
RUN mkdir /docker-entrypoint-init.d

EXPOSE 	8000

COPY docker-entrypoint.sh /
COPY trytond.conf /etc/trytond
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["trytond"]





