#! /bin/bash
source set-env.sh
sudo apt-get -y --force-yes install libguestfs-tools qemu-utils libvirt-dev ruby-dev libvirt-bin nfs-kernel-server
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-hostmanager
vagrant plugin install --plugin-version ">= 0.0.31" vagrant-libvirt
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-proxyconf
vagrant plugin install vagrant-mutate
