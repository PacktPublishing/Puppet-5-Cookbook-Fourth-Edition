# class to configure keepalived
class keepalived (
  String $interface   = 'eth1',
  String $real_name   = 'cookbook.example.com',
  Array $real_servers = {},
  String $auth_pass   = 'PacktPub',
  String $vip         = '',
) {

  package {'ipvsadm':
    ensure => 'installed',
  }
  package {'keepalived':
    ensure => 'installed',
  }
  service {'keepalived':
    ensure  => 'running',
    enable  => true,
    require => Package['keepalived'],
  }

  if $facts['hostname'] == 'cookbook' {
    $state = 'MASTER'
    $virtual_router_id = 50
    $priority = 150
  } else {
    $state = 'BACKUP'
    $virtual_router_id = 50
    $priority = 149
  }
  file {'/etc/keepalived/keepalived.conf':
    content => epp('keepalived/keepalived.conf.epp'),
    mode    => '0644',
    notify  => Service['keepalived'],
  }
}
