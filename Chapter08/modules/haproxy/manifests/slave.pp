# slave member of proxy
class haproxy::slave (
  String $app        = 'myapp',
  Integer $localport = 8000
) {
  # haproxy slave, export haproxy.cfg fragment
  # configure simple webserver on different port
  @@concat::fragment { "haproxy.cfg ${::fqdn}":
    content => "\t\tserver ${::hostname} ${::ipaddress_eth1}:${localport}   check maxconn 100\n",
    target  => 'haproxy.cfg',
    order   => '0010',
    tag     => $app,
  }
  include myfw
  firewall {"${localport} Allow HTTP to haproxy::slave":
    proto  => 'tcp',
    dport   => $localport,
    action => 'accept',
  }

  selinux::port { 'allow-http-haproxy':
    ensure   => 'present',
    seltype  => 'http_port_t',
    protocol => 'tcp',
    port     => 8000,
    before   => Class['apache']
  }

  class {'apache': }
  apache::vhost { 'haproxy.example.com':
    port    => 8000,
    docroot => '/var/www/haproxy',
  }
  file {'/var/www/haproxy':
    ensure  => 'directory',
    mode    => '0755',
    require => Class['apache'],
  }
  $index = @("INDEX")
    <html>
      <body>
        <h1>${::fqdn} haproxy::slave</h1>
      </body>
    </html>
    | INDEX
  file {'/var/www/haproxy/index.html':
    mode    => '0644',
    content => $index,
    require => File['/var/www/haproxy'],
  }
}
