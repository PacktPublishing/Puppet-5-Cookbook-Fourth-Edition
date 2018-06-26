package {'git':
  ensure => 'installed'
}

File {
  owner => '1100',
  group => '1100',
  mode  => '0755',
}

file {'githome':
  ensure => 'directory',
  path   => '/usr/local/git',
}

group {'git':
  gid => '1100',
}

user {'git':
  uid     => '1100',
  gid     => '1100',
  home    => '/usr/local/git',
  comment => 'GIT User',
}

file {'git-ssh':
  ensure => 'directory',
  path   => '/usr/local/git/.ssh',
  mode   => '0700',
}

$git_id_rsa = @(GIT)
  -----BEGIN RSA PRIVATE KEY-----
  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
  -----END RSA PRIVATE KEY-----
  | GIT

file {'git-id_rsa':
  path    => '/usr/local/git/.ssh/id_rsa',
  content => $git_id_rsa,
  mode    => '0600',
  require => File['git-ssh'],
}

exec {'download git.example.com host key':
  command => 'ssh-keyscan git.example.com >>/usr/local/git/.ssh/known_hosts',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  unless  => 'grep git.example.com /usr/local/git/.ssh/known_hosts',
  user    => 'git',
  require => [ User['git'], 
               File['git-ssh']
             ],
}

file {'cookbook':
  ensure => 'directory',
  path   => '/usr/local/git/cookbook'
}

exec {'create cookbook':
  command => 'git clone git@git.example.com:repos/puppet.git cookbook',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  cwd     => '/usr/local/git',
  user    => 'git',
  require => [ User['git'],
               Package['git'],
               File['git-id_rsa'],
               Exec['download git.example.com host key']
             ],
  unless  => 'test -f /usr/local/git/cookbook/.git/config',
}
