#!/bin/bash
yum remove facter puppet hiera ruby ruby-augeas -y
rm -rf /etc/puppet/
rm -rf /var/lib/puppet/

