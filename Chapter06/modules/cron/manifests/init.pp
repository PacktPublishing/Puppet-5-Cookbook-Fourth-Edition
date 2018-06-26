class cron {
  file { '/etc/cron.hourly/run-backup':
    content => epp('cron/backup.epp'),
    mode    => '0755',
  }
}
