#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

echo "########## START ##########"
echo "########## Apt update and upgrade ##########"
apt-get update
apt-get upgrade -y

echo "########## Install packages ##########"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "########## Get apt-key ##########"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "########## Add docker apt repository ##########"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "########## Install docker ##########"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

echo "########## Get and install docker-compose ##########"
if [ ! -f /usr/local/bin/docker-compose ]; then
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
fi

echo "########## Set docker-compose +x ##########"
chmod a+x /usr/local/bin/docker-compose

echo "########## Build and run jenkins container ##########"
cd /vagrant
docker-compose -f jenkins/docker-compose.yml up -d --build

echo "########## END ##########"