$motd = @("MOTD")
  Welcome to ${facts['hostname']}
  This machine is managed by Puppet.
  | MOTD
file {'/etc/motd':
  content =>  $motd,
  mode    => '0644'
}
