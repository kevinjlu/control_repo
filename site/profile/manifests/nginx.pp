class profile::nginx {
  package { 'nginx':
    ensure => installed,
  }

  file { '/etc/nginx/conf.d/10-test.conf'
    ensure => file
    source => 'puppet:///modules/profile/test.conf'
  }
}
