# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

def local_ip
  orig = Socket.do_not_reverse_lookup
  Socket.do_not_reverse_lookup =true # turn off reverse DNS resolution temporarily
  UDPSocket.open do |s|
    s.connect '8.8.8.8', 1 #google
    s.addr.last
  end
ensure
  Socket.do_not_reverse_lookup = orig
end


Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname =  Pathname.new(File.dirname(__FILE__)).basename

  proxy_ip = local_ip
  config.proxy.http     = "http://%s:3128/" % [proxy_ip]
  #config.proxy.https    = "http://192.168.0.2:3128/"
  config.proxy.no_proxy = "localhost,127.0.0.1,.example.com,10.0.2.15/24,192.168.33.10/24"

  config.ssh.insert_key = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else
      cpus = 2
      mem = 2048
    end
    vb.customize ["modifyvm", :id, "--cpus", cpus]
    vb.customize ["modifyvm", :id, "--memory", mem]
  end
  config.vm.provision "shell" do |s|
     ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
     s.inline = <<-SHELL
       echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
       echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
     SHELL
   end

  #config.vm.provision :shell, path: "bootstrap.sh"
end
