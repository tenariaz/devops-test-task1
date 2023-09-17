# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vbguest.auto_update = false

  config.vm.synced_folder ".", "/vagrant"
  
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
	  sudo apt-get install -y software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible zip unzip python-pip
	  sudo pip install boto boto3
	  sudo mkdir /key
	  sudo cp /vagrant/scripts/deploy/key/*pem /key
	  sudo chmod 400 /key/*pem
	  sudo chown vagrant:vagrant /key/*pem
  SHELL
end