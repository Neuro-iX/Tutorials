###
#MASTER
###

apt update
apt upgrade

#https://puppet.com/docs/puppet/latest/puppet_platform.html#task-383
cd /tmp
wget https://apt.puppet.com/puppet6-release-bionic.deb
dpkg -i puppet6-release-bionic.deb
apt update

#https://puppet.com/docs/puppetserver/latest/install_from_packages.html
apt install puppetserver
echo " 
10.180.169.71 puppetmaster
10.180.169.71 puppet
10.180.169.71 puppetmaster.logti053235l
10.180.169.71 puppet.logti053235l
" >> /etc/hosts

#https://puppet.com/docs/puppet/latest/config_file_main.html
echo "  
[master]
dns_alt_names = puppetmaster,puppetmaster.logti053235l,puppet,puppet.logti053235l
# reports = puppetdb
# storeconfigs_backend = puppetdb
# storeconfigs = true

[main]
certname = puppetmaster.logti053235l
server = puppetmaster
runinterval = 1h
strict_variables = true
# server_urls = https://puppetdb.logti053235l:8081
" >> /etc/puppetlabs/puppet/puppet.conf

systemctl start puppetserver
systemctl enable puppetserver

cd /opt/puppetlabs/puppet/bin/
./puppet agent --test

###
#AGENT
###

#https://puppet.com/docs/puppet/latest/puppet_platform.html#task-383
cd /tmp
wget https://apt.puppet.com/puppet6-release-bionic.deb
dpkg -i puppet6-release-bionic.deb
apt update

apt install puppet-agent

echo "
192.168.15.210 puppetmaster
192.168.15.210 puppet
192.168.15.210 puppetmaster.logti053235l
192.168.15.210 puppet.logti053235l
" >> /etc/hosts

#https://puppet.com/docs/puppet/latest/config_file_main.html
echo "
[main]
certname = puppetagent.logti053235l
server = puppetmaster
runinterval = 1h
environment = production
" >> /etc/puppetlabs/puppet/puppet.conf

cd /opt/puppetlabs/puppet/bin
./puppet agent --test

###
#MASTER
###

cd /opt/puppetlabs/server/bin
./puppetserver ca list
./puppetserver ca sign --certname puppetagent.logti053235l
./puppetserver ca sign --all

###
#AGENT 
###

./puppet agent --test

###
#MASTER BASIC Manifest example: Apache2
###

echo "
package { 'apache2':
  ensure => present,
}

service { 'apache2':
  ensure => running,
  enable => true,
}
" >> /etc/puppetlabs/code/environments/production/manifests/apache2.pp
