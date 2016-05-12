#! /bin/bash
source set-env.sh
vagrant destroy
if [ "$1" = "l" ]
then
    vagrant up --provider=libvirt
else
    vagrant up
fi
