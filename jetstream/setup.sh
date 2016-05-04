#!/bin/bash
set -x

sudo adduser unidata

sudo adduser unidata sudo

sudo groupadd docker

sudo usermod -aG docker unidata

sudo apt-get -qq update
sudo apt-get -qq install apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" |
sudo tee --append /etc/apt/sources.list.d/docker.list  > /dev/null

sudo apt-get -qq update

sudo apt-get -qq purge lxc-docker

sudo apt-cache policy docker-engine

sudo apt-get -qq update
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install apparmor

sudo apt-get -qq update

sudo apt-get -qq install docker-engine

sudo service docker start
