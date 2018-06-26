package {'git':
  ensure => installed
}
group { 'git': gid => 1111, }
user {'git':
  uid     => 1111,
  gid     => 1111,
  comment => 'Git User',
  home    => '/home/git',
  require => Group['git'],
}
file {'/home/git':
  ensure  => 'directory',
  owner   => 1111,
  group   => 1111,
  require => User['git'],
}
file {'/home/git/repos':
  ensure => 'directory',
  owner => 1111,
  group => 1111,
  require => File['/home/git']
}
