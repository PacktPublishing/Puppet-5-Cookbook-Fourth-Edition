file { '/etc/php5/cli/php.ini':
  ensure => link,
  target => '/etc/php.ini',
}
