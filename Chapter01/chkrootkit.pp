cron { 'chkrootkit':
  command => '/usr/sbin/chkrootkit > /var/log/chkrootkit.log 2>&1',
  hour => inline_template('<%= @hostname.sum % 24 %>'),
  minute => '00',
}
