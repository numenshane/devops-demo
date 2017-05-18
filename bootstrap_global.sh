#!/bin/bash
sudo su -
echo "Config Yum repo and update"
yum update -y
yum install wget -y
wget -c https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum install epel-release -y

# for every vm to run ansible-playbook inside
echo "Installing Ansible..."
yum install ansible -y
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
