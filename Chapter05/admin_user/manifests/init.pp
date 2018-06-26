# define for admin_user
define admin_user (
  String                        $key,
  Enum['ssh-rsa','ssh-ed25519'] $keytype,
) {
  $username = $name
  user { $username:
    ensure => present,
  }
  file { "/home/${username}/.ssh":
    ensure  => directory,
    mode    => '0700',
    owner   => $username,
    group   => $username,
    require => File["/home/${username}"],
  }
  ssh_authorized_key { "${username}_key":
    key     => $key,
    type    => $keytype,
    user    => $username,
    require => File["/home/${username}/.ssh"],
  }
  # copy in all the files in the subdirectory
  file { "/home/${username}":
    recurse      => true,
    mode         => '0700',
    owner        => $username,
    group        => $username,
    source       => [
      "puppet:///modules/admin_user/${username}",
      'puppet:///modules/admin_user/base' ],
    sourceselect => 'all',
    require      => User[$username],
  }
}
