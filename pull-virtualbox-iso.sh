#!/bin/bash
version=` VBoxManage  --version`
version=`echo ${version/_/ /}|awk '{print $1}'`
echo $version
wget http://download.virtualbox.org/virtualbox/$version/VBoxGuestAdditions_$version.iso
