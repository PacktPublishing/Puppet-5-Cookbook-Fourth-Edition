schedule { 'outside-office-hours':
  period => daily,
  range => ['17:00-23:59','00:00-09:00'],
  repeat => 1,
}

node 'cookbook' {
#  $mysql_password='TopSecret'
#  file { '/usr/local/bin/backup-mysql':
#    content => template('admin/backup-mysql.sh.erb'),
#    mode    => '0755',
#  }
#  $ipaddresses = ['192.168.0.1','158.43.128.1', '10.0.75.207' ]
#  file { '/tmp/addresslist.txt':
#    content => template('base/addresslist.erb')
#  }
#  $message = secret('/etc/puppetlabs/code/environments/production/modules/admin/files/secret_message.gpg')
#  notify { "The secret message is: ${message}": }
  include user::virtual
  include user::sysadmins
  include user::developers
  include base
  cron { 'run-backup':
    ensure  => present,
    command => '/usr/local/bin/backup',
    hour    => split($facts['ipaddress'],'\.')[3] % 24,
    minute  => '00',
  }
  cron { 'dump-database':
    ensure  => present,
    command => '/usr/local/bin/dump_database',
    hour    => split($facts['ipaddress'],'\.')[3] + 1 % 24,
    minute  => '00',
  }
  include cron
  notify { 'Doing some maintenance':
    schedule => 'outside-office-hours',
  }
  host { 'packtpub.com':
    ensure => present,
    ip     => '83.166.169.231',
  }  
  include db::client
  class { 'greeting': }
  admin_user {'steven':
    key => 'AAAAB3N...',
    keytype => 'ssh-rsa',
  }
  tidy { '/var/log':
    age => '2w',
    recurse => true,
  }
  file { '/etc/passwd':
    audit => [ owner,mode ],
  }
  file { '/etc/resolv.conf':
    content => "nameserver 127.0.0.1\n",
    noop => true,
  }
}

node 'jumpbox' {
  Sshkey <<| |>>
}

node "dbserver1.example.com" {
  class {'db::server': }
}
node "dbserver2.example.com" {
  class {'db::server': }
}
node default {
  include base
  include puppet
}
