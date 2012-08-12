class apt inherits apt::params {

  anchor { 'apt::begin': }
  -> class { 'apt::package': }
  -> class { 'apt::config': }
  -> anchor { 'apt::end': }
}
