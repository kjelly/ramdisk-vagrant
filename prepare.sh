#! /bin/bash
source set-env.sh
vagrant plugin install vagrant-hostmanager
vagrant plugin install --plugin-version ">= 0.0.31" vagrant-libvirt
vagrant plugin install vagrant-vbguest


