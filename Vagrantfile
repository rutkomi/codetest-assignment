# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "codetest-assignment-box"
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.network "private_network", ip: "192.168.123.101"

  config.vm.network "forwarded_port", guest: 8181, host: 8181
  config.vm.network "forwarded_port", guest: 8282, host: 8282
  config.vm.network "forwarded_port", guest: 50000, host: 50000

  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = "4096"
  end

  #config.vm.provision "ansible_local" do |ansible|
  #  ansible.playbook = "playbook.yml"
  #  ansible.verbose = true
  #  ansible.become = true
  #end
  config.vm.provision "shell", path: "bootstrap.sh"
  
end
