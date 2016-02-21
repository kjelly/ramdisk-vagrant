sudo cat > /etc/apt/sources.list <<EOL
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOL

sudo apt-get update
sudo apt-get install -y curl git python-dev python-pip curl
sudo -u vagrant git clone https://github.com/ya790206/auto_config --branch ansible /home/vagrant/auto_config
sudo -u vagrant cat > /home/vagrant/auto_config/site.yml <<EOL
- name: install
  remote_user: vagrant
  hosts: target

  roles:
      - common-packages
      - developer-packages
      - zsh
      - bash-it
      - vim
      - docker
EOL

cat > /etc/pip.conf <<EOL
[global]
# /etc/pip.conf
proxy = 192.168.1.172:3128
EOL

sudo pip install ansible
echo 'start ansible playbook'
su vagrant -c ' ansible-playbook -i /home/vagrant/auto_config/hosts /home/vagrant/auto_config/site.yml -vvv --extra-vars "ansible_user=`whoami`"'
echo 'end ansible playbook'
