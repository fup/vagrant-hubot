class apt::package {
  package { $apt::params::packages:
    ensure => present,
  }
}
