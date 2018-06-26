# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { base:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class base {
  #  file {'/etc/motd':
  #  content => "${::fqdn}\nManaged by puppet ${::puppetversion}\n"
  #}
  augeas { 'enable-ip-forwarding':
    incl    => '/etc/sysctl.conf',
    lens    => 'Sysctl.lns',
    changes => ['set net.ipv4.ip_forward 1'],
  }

  concat {'hosts.allow': 
    path => '/etc/hosts.allow',
    mode => 0644
  }

  concat::fragment {'hosts.allow header':
    target  => 'hosts.allow',
    content => "# File managed by puppet\n",
    order   => '01'
  }
  concat::fragment {'hosts.allow local':
    target => 'hosts.allow',
    source => '/etc/hosts.allow.local',
    order  => '10',
  }
  concat::fragment {'hosts.allow tftp':
    target  => 'hosts.allow',
    content => "in.ftpd: .example.com\n",
    order   => '50',
  }
}
