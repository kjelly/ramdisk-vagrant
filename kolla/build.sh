#! /bin/bash
/kolla/tools/build.py -b ubuntu -t source -i /vagrant/header -I /vagrant/footer --no-cache keystone cinder nova neutron glance haproxy keepalive logging  $@
