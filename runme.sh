#!/bin/bash
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
puppet module install puppetlabs-postgresql
puppet apply applyme.pp

