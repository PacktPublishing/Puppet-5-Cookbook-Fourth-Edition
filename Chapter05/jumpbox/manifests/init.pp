class jumpbox { 
  Sshkey <<| |>>
  file {"tmp":
    path    => "/tmp/tmp",
    content => 'hello',
  }
}
