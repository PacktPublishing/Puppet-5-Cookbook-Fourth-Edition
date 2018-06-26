define ssh_user ($key, $keytype) { 
  user { $name:
    ensure     => present,
  }

  file { "/home/${name}":
    ensure => directory,
    mode => '0700',
    owner => $name,
    require => User["$name"]
  }
  file { "/home/${name}/.ssh":
    ensure => directory,
    mode   => '0700',
    owner  => $name ,
    require => File["/home/${name}"],
  }

  ssh_authorized_key { "${name}_key":
    key     => $key,
    type    => "$keytype",
    user    => $name,
    require => File["/home/${name}/.ssh"],
  }
}
