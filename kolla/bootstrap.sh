git clone https://github.com/openstack/kolla /kolla
chown -R vagrant:vagrant /kolla
pip install -r /kolla/requirements.txt
/vagrant/setup-docker.sh
sudo apt-get install -y --force-yes linux-image-generic-lts-vivid
