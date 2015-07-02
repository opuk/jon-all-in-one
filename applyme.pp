##### VARIABLES
$db_name = 'rhq'
$db_user = 'rhqadmin'
$db_password = 'rhqadmin'
$user = 'jon'
$install_path = "/opt/jon"
$jon_version = "3.3.0.GA"
$jon_zip = "/tmp/jon-server-$jon_version.zip"

##### VARIABLES END 

class { 'postgresql::server': }

postgresql::server::db { $db_name:
  user     => $db_user,
  password => postgresql_password($db_user, $db_password),
  require => Class["postgresql::server"],
}

user { $user:
  ensure => present,
  managehome => true,
}

file { $install_path:
  ensure => directory,
  owner => $user,
  group => $user,
  require => User[$user],
}

package { 'java-1.8.0-openjdk': ensure => present } 
package { 'java-1.8.0-openjdk-devel': ensure => present } 
package { 'unzip': ensure => present } 

exec { "/usr/bin/unzip $jon_zip":
  user => $user,
  creates => "$install_path/jon-server-$jon_version",
  cwd => $install_path,
  require => [ Package["unzip"], User[$user], Class["postgresql::server"] ], 
}

file { "$install_path/jon-server-$jon_version/bin/rhq-server.properties":
  source => "file:///root/jon-all-in-one/rhq-server.properties",
  owner => jon,
  group => jon,
  require => Exec["/usr/bin/unzip $jon_zip"],
}

exec { "$install_path/jon-server-$jon_version/bin/rhqctl install --start":
  user => $user,
  creates => "$install_path/rhq-agent",
  cwd => "$install_path/jon-server-$jon_version/bin",
  require => [ File["$install_path/jon-server-$jon_version/bin/rhq-server.properties"], Postgresql::Server::Db[$db_name] ],
}
