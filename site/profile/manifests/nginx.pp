class profile::nginx {
  package { 'nginx':
    ensure => installed,
  }
}

