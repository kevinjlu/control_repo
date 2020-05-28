class profile::nginx (String $port = '80') {
  package { 'nginx':
    ensure => installed,
  } ->

  file { '/etc/nginx/conf.d/10-test.conf':
    ensure => 'file',
    # source => 'puppet:///modules/profile/test.conf',
    content => template('profile/test.conf.erb')
  } ~>

  service { 'nginx':
    ensure => 'running',
    enable => 'true',
  }
}
