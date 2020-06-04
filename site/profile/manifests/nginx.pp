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

  file { '/usr/local/bin/script.sh':
    ensure => 'file',
    source => 'puppet:///modules/profile/script.sh',
    owner => 'root',
    group => 'root',
    mode => '0755',
  } ->

  cron { 'test-cron':
    command  => '/bin/bash -c "if [[ ! (-f /var/lib/apt/periodic/update-success-stamp && $(stat -c %Y /var/lib/apt/periodic/update-success-stamp) -gt $(date -d \'-20 hours\' +%s)) ]] ; then apt-get update; fi"',
    user     => 'root',
    hour     => fqdn_rand(24, 'hour'),
    minute   => fqdn_rand(60, 'minute'),
  }
}
