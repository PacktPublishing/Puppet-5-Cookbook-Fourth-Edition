$ifaces = [
  {
    name => 'eth0',
    ip   => '192.168.0.1'
  },{
    name => 'eth1',
    ip   => '158.43.128.1'
  }, {
    name => 'eth2',
    ip   => '10.0.75.207'
  } ]

$content = @(HASH)
  <% @ifaces.each do |iface| -%>
  Interface <%= iface['name'] %> has the address <%= iface['ip'] %>.
  <% end -%>
  | HASH
 
file {'/tmp/hash': 
  content => inline_template($content),
}
