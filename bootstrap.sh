sudo cat > /etc/apt/sources.list <<EOL
deb http://mirror01.idc.hinet.net/ubuntu/ trusty main restricted
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty main restricted

deb http://mirror01.idc.hinet.net/ubuntu/ trusty-updates main restricted
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-updates main restricted

deb http://mirror01.idc.hinet.net/ubuntu/ trusty universe
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty universe
deb http://mirror01.idc.hinet.net/ubuntu/ trusty-updates universe
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-updates universe

deb http://mirror01.idc.hinet.net/ubuntu/ trusty multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty multiverse
deb http://mirror01.idc.hinet.net/ubuntu/ trusty-updates multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-updates multiverse

deb http://mirror01.idc.hinet.net/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-backports main restricted universe multiverse

deb http://mirror01.idc.hinet.net/ubuntu/ trusty-security main restricted
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-security main restricted
deb http://mirror01.idc.hinet.net/ubuntu/ trusty-security universe
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-security universe
deb http://mirror01.idc.hinet.net/ubuntu/ trusty-security multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ trusty-security multiverse

deb https://apt.dockerproject.org/repo ubuntu-trusty main

EOL

sudo apt-get update
sudo apt-get install -y curl git python-dev python-pip curl
sudo -u vagrant git clone https://github.com/ya790206/auto_config
sudo -u vagrant cat > /home/vagrant/auto_config/site.yml <<EOL
- name: install
  remote_user: "{{ ansible_user }}"
  hosts: "{{ group }}"
  vars:
    programming: false

  roles:
      - zsh
      - bash-it
      - vim
      - fish
EOL

cat > /etc/pip.conf <<EOL
[global]
# /etc/pip.conf
proxy = 192.168.1.49:3128
EOL
sudo bash /home/vagrant/auto_config/install-deb-dependency.sh
sudo pip install ansible==2.0.0.0
echo 'start ansible playbook'
su vagrant -c ' python /home/vagrant/auto_config/run.py -i /home/vagrant/auto_config/hosts -p /home/vagrant/auto_config/site.yml -a deploy '
echo 'end ansible playbook'
