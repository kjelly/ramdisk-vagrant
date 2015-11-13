#! /bin/bash
vagrant destroy
vagrant up
rm package.box
vagrant package
vagrant box add my package.box --force

