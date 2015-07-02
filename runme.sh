#!/bin/bash
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install puppet -y
puppet module install puppetlabs-postgresql
puppet apply applyme.pp

