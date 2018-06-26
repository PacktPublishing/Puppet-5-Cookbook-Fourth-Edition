class rsyslog {
  file { '/etc/rsyslog.conf': source => [
    "puppet:///modules/rsyslog/rsyslog.conf.${::hostname}",
    'puppet:///modules/rsyslog/rsyslog.conf'],
  }
}
