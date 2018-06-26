class puppet {
  $papply = @("PAPPLY")
    #!/bin/sh
    cd /usr/local/git/cookbook
    sudo -u git git pull -q origin master
    sudo /opt/puppetlabs/bin/puppet apply \
      /usr/local/git/cookbook/manifests/site.pp \
      --modulepath=/usr/local/git/cookbook/modules $*
    | PAPPLY

  file { '/usr/local/bin/papply':
    content => $papply,
    mode    => '0755',
  }

  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode   => '0755',
  }

  cron { 'run-puppet':
    ensure  => 'present',
    user    => 'puppet',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour    => '*',
  }
}
