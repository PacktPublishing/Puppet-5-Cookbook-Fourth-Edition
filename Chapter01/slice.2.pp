$firewall_rules = ['192.168.0.1','80',
                   '192.168.0.10','443']
slice ($firewall_rules,2) |$ip, $port| {
  firewall { "$port from $ip":
    dport  => $port,
    source => "$ip",
    action => 'accept',
  }
}
