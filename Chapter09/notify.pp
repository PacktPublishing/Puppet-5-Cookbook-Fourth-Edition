notify {"operating system is ${facts['os']['name']}": }
notify {"failed exec on ${hostname}": }
  -> exec {'failing exec':
       command   => "/bin/grep ${hostname} /etc/hosts",
       logoutput => true,
     }
