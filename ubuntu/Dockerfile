# base image ubuntu 14.04 image
FROM ubuntu:trusty

# create booktype group, booktype user and assign it to the group
RUN groupadd booktype && useradd booktype -g booktype -u 1000

# install system-wide dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor \
    nginx \
    git-core \
    python-dev \
    python-pip \
    libjpeg-dev \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    tidy \
    php5-cli \
    php5-gd \
    calibre

RUN pip install uwsgi