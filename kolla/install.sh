#! /bin/bash
source set-env.sh
rm package.box
vagrant package
vagrant box add kolla package.box --force

