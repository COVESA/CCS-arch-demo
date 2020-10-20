#!/bin/sh

# Some programs depend on tzdata, which tries to ask stupid interactive
# questions during installation. User-interaction doesn't work during docker
# build.  Let's get around this problem
# Ref: https://serverfault.com/questions/949991/how-to-install-tzdata-on-a-ubuntu-docker-image

export DEBIAN_FRONTEND=noninteractive
apt-get install -y tzdata
ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

