#!/bin/bash
#PREP ONLY
#Do not use unless playing with separate storage nodes
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install puppet -y
puppet apply prep.pp

