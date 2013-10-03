#!/bin/sh
git clone https://github.com/dotcloud/docker.git
cd docker
git fetch origin
git remote add patches https://github.com/fkautz/docker.git
git fetch patches
git checkout v0.6.3
git merge patches/v0.6.3-offline-image-transfer
docker build -t docker .
docker run -lxc-conf=lxc.aa_profile=unconfined -privileged -v `pwd`:/go/src/github.com/dotcloud/docker docker hack/make.sh binary ubuntu
if [ -e ./bundles/0.6.3/binary/docker-0.6.3 ]
then
  service docker stop
  cp ./bundles/0.6.3/binary/docker-0.6.3 /usr/bin/docker
  service docker start
fi
