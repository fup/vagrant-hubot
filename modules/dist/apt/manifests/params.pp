class apt::params {
  $packages = 'update-notifier-common'
  $required_directories = ['/var/cache/local', '/var/cache/local/preseeding']
  $stale_time = '360'
}
