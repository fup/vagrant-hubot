class apt::config {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  file { $apt::params::required_directories:
    ensure => directory,
    mode   => '0755',
  }
  exec { 'apt-get update':
    command => 'apt-get update',
    creates => '/var/lib/apt/periodic/update-success-stamp',
    require => Exec['delete aged update-success-stamp'],
  }
  exec { 'delete aged update-success-stamp':
    command => "find /var/lib/apt/periodic -type f -mmin +${apt::params::stale_time} -delete",
    onlyif  => "find /var/lib/apt/periodic -type f -mmin +${apt::params::stale_time} | grep update-success-stamp | grep -v grep",
  }
}
