##### VARIABLES
$db_name = 'rhq'
$db_user = 'rhqadmin'
$db_password = 'rhqadmin'
$user = 'jon'
$install_path = '/opt/jon'
$jon_version = '3.3.0.GA'
$jon_zip = "/tmp/jon-server-${jon_version}.zip"

##### VARIABLES END 

user { $user:
  ensure     => present,
  managehome => true,
}

file { $install_path:
  ensure  => directory,
  owner   => $user,
  group   => $user,
  require => User[$user],
}

package { 'java-1.8.0-openjdk': ensure => present }
package { 'java-1.8.0-openjdk-devel': ensure => present }
package { 'unzip': ensure => present }

