class base {
  augeas { 'enable-ip-forwarding':
    incl    => '/etc/sysctl.conf',
    lens    => 'Sysctl.lns',
    changes => ['set net.ipv4.ip_forward 1'],
  }
  $content = @("MOTD")
    ${::fqdn}
    Managed by puppet ${::puppetversion}
    | MOTD
  file {'/etc/motd':                     
    content => $content                  
  }                 
                    
  # concat example  
  concat {'hosts.allow':                 
    path => '/etc/hosts.allow',          
    mode => '0644', 
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
  include base::ssh_host         
}
