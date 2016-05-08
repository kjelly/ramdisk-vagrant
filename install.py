#!/usr/bin/env python
import os

with open('Vagrantfile', 'r') as ftr:
    for i in ftr.readlines():
        if 'config.vm.box' in i:
            box = i.strip()
            break
box_name = box.split('=')[-1].strip()[1:-1]
if '/' in box_name:
    box_name = box_name.split('/')[-1]
new_box_name = 'my-%s' % box_name
print(new_box_name)


os.system("rm package.box")
os.system("vagrant package")
os.system("vagrant box add %s package.box --force" % new_box_name)
os.system("vagrant mutate %s --input-provider=virtualbox libvirt" % new_box_name)

