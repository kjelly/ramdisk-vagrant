sudo cat > /etc/apt/sources.list <<EOL
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOL

sudo apt-get update
sudo apt-get install -y curl git python-dev python-pip curl
sudo -u vagrant git clone https://github.com/ya790206/auto_config --branch ansible ~/auto_config
sudo -u vagrant cat > ~/auto_config/site.yml <<EOL
- name: install
  remote_user: root
  hosts: target

  roles:
      - common-packages
      - developer-packages
      - zsh
      - bash
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
sudo -u vagrant ansible-playbook -i ~/auto_config/hosts ~/auto_config/site.yml -vvv
echo 'end ansible playbook'
