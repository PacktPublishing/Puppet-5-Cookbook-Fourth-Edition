class base::ssh_host {
  @@sshkey{ $::fqdn:
    ensure       => 'present',
    host_aliases => ["$::hostname","$::ipaddress"],
    key          => $facts['ssh']['rsa']['key'],
    type         => 'rsa',
  }
}
