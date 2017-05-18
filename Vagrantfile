# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "centos/7"
  #config.vm.box = "bento/centos-7.2"
  # If you run into issues with Ansible complaining about executable permissions,
  # comment the following statement and uncomment the next one.
  config.vm.synced_folder ".", "/vagrant"
  # config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  # scheduling and clustering system just single node 
  config.vm.define :prod do |prod|
    prod.vm.network :forwarded_port, host: 9090, guest: 8080
    prod.vm.network :forwarded_port, host: 2202, guest: 22, id: "ssh", auto_correct: true
    prod.vm.network "private_network", ip: "192.168.100.2"
    prod.vm.provision "shell", path: "bootstrap_global.sh"
    prod.vm.provision "shell", path: "bootstrap_prod.sh"
    prod.vm.hostname = "prod"
  end
  # dockerized jenkins master,docker, docker registry, consul,jdk, jenkins slave
  config.vm.define :devtest2 do |devtest2|
    devtest2.vm.network :forwarded_port, host: 8080, guest: 8080
    devtest2.vm.network :forwarded_port, host: 8081, guest: 8500
    devtest2.vm.network :forwarded_port, host: 5000, guest: 5000
    devtest2.vm.network :forwarded_port, host: 2203, guest: 22, id: "ssh", auto_correct: true
    devtest2.vm.network "private_network", ip: "192.168.100.3"
    devtest2.vm.provision "shell", path: "bootstrap_global.sh"
    devtest2.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/devtest.yml -i /vagrant/ansible/hosts/devtest -c local -v'
    devtest2.vm.hostname = "devtest2"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
 #if Vagrant.has_plugin?("vagrant-proxyconf")
 #  config.proxy.http    = "http://198.74.106.172:10018/"
 #  config.proxy.https   = "http://198.74.106.172:10018/"
 #  config.proxy.no_proxy = "localhost,127.0.0.1"
 #end
end
