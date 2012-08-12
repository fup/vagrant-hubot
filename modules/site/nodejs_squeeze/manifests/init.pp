class nodejs_squeeze {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  $nodejs_version = 'nodejs-0.8.6-1_i386.deb'

  exec { 'download-nodejs-squeeze':
    command => "wget http://dl.dropbox.com/u/443584/Packages/${nodejs_version} -O /tmp/${nodejs_version}",
    creates => "/tmp/${nodejs_version}",
  }
  package { 'nodejs':
    ensure   => present,
    provider => dpkg,
    source   => "/tmp/${nodejs_version}",
    require  => Exec['download-nodejs-squeeze'],
  }
}
