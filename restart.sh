#! /bin/bash
source set-env.sh
vagrant destroy
vagrant up  --provider=libvirt
