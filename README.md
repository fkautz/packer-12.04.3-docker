Requires packer from http://www.packer.io/

``` sh
$ ./build.sh # Only necessary temporarily until 0.7 comes out
$ packer build image.json
```

OVA output will be located in output-virtualbox/

Packer requirements:
* packer
* virtualbox

build.sh requirements:
* go 1.1.2
* git
* mercurial
* subversion
