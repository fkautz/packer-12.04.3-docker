#!/bin/sh

### assumes go is installed and $GOROOT is already set

GOPATH=`pwd`/go
mkdir go
rm docker

go get github.com/fkautz/docker
pushd go/src/github.com/dotcloud/docker
git remote add patches https://github.com/fkautz/docker.git
git fetch patches
git checkout v0.6.3
git cherry-pick patches/v0.6.3-offline-image-transfer
go install github.com/dotcloud/docker/docker
popd
cp $GOPATH/bin/docker .

