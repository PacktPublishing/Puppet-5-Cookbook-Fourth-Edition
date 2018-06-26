# a single export resource
define nfs::export (
  String $where         = $title,
  String $who           = '*',
  String $options       = 'async,ro',
  String $mount_options = 'defaults',
  String $tag           = 'nfs'
) {
  # make sure the directory exists
  # export the entry locally, then export a resource to be picked up later.
  file {$where:
    ensure => 'directory',
  }
  include nfs::exports
  concat::fragment { "nfs::export::${where}":
    content => "${where} ${who}(${options})\n",
    target  => '/etc/exports'
    require => File[$where],
  }
  @@mount { "nfs::export::${where}::${::ipaddress}":
    ensure  => 'mounted',
    name    => $where,
    fstype  => 'nfs',
    options => $mount_options,
    device  => "${::ipaddress}:${where}",
    tag     => $tag,
  }
}
