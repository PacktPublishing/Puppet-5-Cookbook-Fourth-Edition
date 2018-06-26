# -*- mode: ruby -*-
# vi: set ft=ruby :

$rhel = <<EOF
rpm -q puppet-agent
if [ $? -ne 0 ]; then
  yum install -y http://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
  yum install -y puppet-agent
fi
EOF
$debian = <<EOF
dpkg -s puppet-agent >/dev/null
if [ $? -ne 0 ]; then
  wget https://apt.puppet.com/puppet5-release-stretch.deb
  dpkg -i puppet5-release-stretch.deb
  apt-get update
  apt-get install -y puppet-agent
fi
EOF
$git = <<EOF
dpkg -s puppet-agent >/dev/null
if [ $? -ne 0 ]; then
  wget https://apt.puppet.com/puppet5-release-stretch.deb
  dpkg -i puppet5-release-stretch.deb
  apt-get update
  apt-get install -y puppet-agent
fi
/opt/puppetlabs/bin/puppet apply /home/vagrant/git.pp
EOF

Vagrant.configure("2") do |config|
  config.vm.define "cookbook" do |cookbook|
    cookbook.vm.box = "centos/7"
    cookbook.vm.provision "shell", inline: $rhel
    cookbook.vm.hostname = "cookbook.example.com"
    cookbook.vm.network "private_network", ip: "192.168.50.10",
      virtualbox__intnet: "puppet"
    cookbook.vm.provision :hosts
  end
  config.vm.define "cookbook2" do |cookbook2|
    cookbook2.vm.box = "centos/7"
    cookbook2.vm.provision "shell", inline: $rhel
    cookbook2.vm.hostname = "cookbook2.example.com"
    cookbook2.vm.network "private_network", ip: "192.168.50.8",
      virtualbox__intnet: "puppet"
    cookbook2.vm.provision :hosts
  end
  config.vm.define "webserver" do |web|
    web.vm.box = "centos/7"
    web.vm.provision "shell", inline: $rhel
    web.vm.hostname = "webserver.example.com"
    web.vm.network "private_network", ip: "192.168.50.11",
      virtualbox__intnet: "puppet"
    web.vm.provision :hosts
  end

  config.vm.define "dbserver" do |db|
    db.vm.box = "centos/7"
    db.vm.provision "shell", inline: $rhel
    db.vm.hostname = "dbserver.example.com"
    db.vm.network "private_network", ip: "192.168.50.12",
      virtualbox__intnet: "puppet"
    db.vm.provision :hosts
  end

  config.vm.define "debian" do |debian|
    debian.vm.box = "debian/stretch64"
    debian.vm.provision "shell", inline: $debian
    debian.vm.hostname = "cookbook.example.com"
    debian.vm.network "private_network", ip: "192.168.50.20",
      virtualbox__intnet: "puppet"
    debian.vm.provision :hosts
  end

  config.vm.define "git" do |git|
    git.vm.box = "debian/stretch64"
    git.vm.provision "file", source: "git.pp", destination: "/home/vagrant/git.pp"
    git.vm.provision "shell", inline: $git
    git.vm.hostname = "git.example.com"
    git.vm.network "private_network", ip: "192.168.50.5",
      virtualbox__intnet: "puppet"
    git.vm.provision :hosts
  end

  config.vm.define "testnode" do |testnode|
    testnode.vm.box = "centos/7"
    testnode.vm.provision "shell", inline: $rhel
    testnode.vm.hostname = "testnode.example.com"
    testnode.vm.network "private_network", ip: "192.168.50.30",
      virtualbox__intnet: "puppet"
    testnode.vm.provision :hosts
  end

  config.vm.define "puppet" do |puppet|
    puppet.vm.box = "centos/7"
    puppet.vm.provision "shell", inline: $rhel
    puppet.vm.hostname = "puppet.example.com"
    puppet.vm.network "private_network", ip: "192.168.50.100",
      virtualbox__intnet: "puppet"
    puppet.vm.provider "virtualbox" do |v|
      v.memory = 1500
    end
    puppet.vm.provision :hosts
  end

  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.provision "shell", inline: $rhel
    master.vm.hostname = "master.example.com"
    master.vm.network "private_network", ip: "192.168.50.140",
      virtualbox__intnet: "puppet"
    master.vm.provider "virtualbox" do |v|
      v.memory = 500
    end
    master.vm.provision :hosts
  end

  (1..2).each do |i|
    config.vm.define "slave#{i}" do |slave|
      slave.vm.box = "centos/7"
      slave.vm.provision "shell", inline: $rhel
      slave.vm.hostname = "slave#{i}.example.com"
      slave.vm.network "private_network", ip: "192.168.50.14#{i}",
        virtualbox__intnet: "puppet"
      slave.vm.provider "virtualbox" do |v|
        v.memory = 500
      end
      slave.vm.provision :hosts
    end
  end

  config.vm.define "shipyard" do |ship|
    ship.vm.box = "centos/7"
    ship.vm.provision "shell", inline: $rhel
    ship.vm.hostname = "shipyard.example.com"
    ship.vm.network "private_network", ip: "192.168.50.220",
      virtualbox__intnet: "puppet"
    ship.vm.provider "virtualbox" do |v|
      v.memory = 1500
    end
    ship.vm.provision :hosts
  end
end
