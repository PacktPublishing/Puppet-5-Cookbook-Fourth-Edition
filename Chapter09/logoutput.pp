exec { 'exec with output':
  command   => '/bin/cat /etc/hostname',
  logoutput => true,
}
