#! /bin/bash
source set-env.sh
sudo apt-get install libguestfs-tools
vagrant plugin install vagrant-hostmanager
vagrant plugin install --plugin-version ">= 0.0.31" vagrant-libvirt
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-proxyconf
