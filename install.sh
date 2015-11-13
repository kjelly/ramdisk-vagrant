#! /bin/bash
source set-env.sh
vagrant destroy
vagrant up
rm package.box
vagrant package
vagrant box add my package.box --force

