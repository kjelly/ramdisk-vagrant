git clone https://github.com/openstack/kolla /kolla
chown -R vagrant:vagrant /kolla
pip install -r /kolla/requirements.txt
/vagrant/setup-docker.sh
