node puppet {
    class { 'puppetdb': }
    class { 'puppetdb::master::config': }
}

node default {
  include base
  $message = lookup('message',String,first,'unknown')
  notify { "Message is ${message}": }
}
