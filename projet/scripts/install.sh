#! /bin/bash

sudo test -f /etc/puppetlabs/puppet/puppetdb.conf && rm /etc/puppetlabs/puppet/puppetdb.conf
sudo test -f /etc/puppetlabs/puppet/routes.yeml && rm /etc/puppetlabs/puppet/routes.yaml

wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
sudo apt -o Dpkg::Options::="--force-confnew" install -y puppetserver
sudo sed -i -e 's/-Xms2g -Xmx2g/-Xms1g -Xmx1g/' /etc/default/puppetserver
sudo systemctl enable puppetserver --now
sudo apt -o Dpkg::Options::="--force-confnew" install -y puppet-agent
echo "\n[main]\nserver = devops01.ynov.com" >> /etc/puppetlabs/puppet/puppet.conf
