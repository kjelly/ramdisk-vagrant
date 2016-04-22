#! /bin/bash
time /kolla/tools/build.py -b ubuntu -t source -i /vagrant/header -I /vagrant/footer --no-cache ceph cinder glance haproxy heat horizon keepalived kekystone kolla-ansible logging rsyslog mariadb memcached neutron nova openvswitch rabbitmq keystone tempest heka "kolla-toolbox" cron $@
