define mywebapp (
  String $domain = $facts['domain'],
  String $path,
  String $platform,
) {
  notify {"${domain} ${path} ${platform}": } 
} 

mywebapp { 'mywizzoapp':
  domain   => 'Rails',
  path     => '/var/www/apps/mywizzoapp',
  platform => 'mywizzoapp.com', 
}

mywebapp {'foo':
  path     => 'fart',
  platform => 'puss',
}
