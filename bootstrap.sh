sudo cat > /etc/apt/sources.list <<EOL
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOL

sudo apt-get update
sudo apt-get install -y curl git python-dev python-pip curl
git clone https://github.com/ya790206/auto_config --branch ansible ~/auto_config
cat > ~/auto_config/site.yml <<EOL
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
sudo pip install ansible
echo 'start ansible playbook'
sudo ansible-playbook -i ~/auto_config/hosts ~/auto_config/site.yml -vvv
echo 'end ansible playbook'
sudo apt-get install -y --force-yes docker-engine=1.8.2-0~trusty
