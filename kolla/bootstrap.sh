git clone https://github.com/openstack/kolla /kolla
chown -R vagrant:vagrant /kolla
pip install -r /kolla/requirements.txt
/vagrant/setup-docker.sh
rm -f /etc/default/docker
curl -sSL https://get.docker.io | bash
usermod -a -G docker vagrant
sudo apt-get install -y --force-yes docker-engine=1.8.2-0~trusty
sudo apt-get install -y --force-yes linux-image-generic-lts-vivid
