# nfs server for Debian
class nfs::server::debian {
  # install the package
  package {'nfs':
    ensure => 'installed',
    name   => 'nfs-kernel-server',
  }
  # config
  file {'/etc/default/nfs-common':
    source => 'puppet:///modules/nfs/nfs-common',
    mode   => '0644',
    notify => Service['nfs-server']
  }
  # services
  service {'nfs-server':
    ensure => 'running',
    enable => true,
  }
  service {'nfs':
    ensure => 'running',
    name   => 'nfs-kernel-server',
    enable => true,
  }
}
