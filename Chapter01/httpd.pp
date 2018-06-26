service {'httpd':
  ensure  => 'running',
  require => Package['httpd'],
}

package {'httpd':
  ensure => 'installed',
}

$cookbook = @(COOKBOOK)
  <VirtualHost *:80>
    Servername cookbook
    DocumentRoot /var/www/cookbook
  </VirtualHost>
  | COOKBOOK
file {'/etc/httpd/conf.d/cookbook.conf':
  content => $cookbook,
  require => Package['httpd'],
  notify  => Service['httpd'],
}

$index = @(INDEX)
  <html>
    <body>
      <h1>Hello World!</h1>
    </body>
  </html>
  | INDEX

file {'/var/www/cookbook':
  ensure  => directory,
  require => Package['httpd'],
}
file {'/var/www/cookbook/index.html':
  content => $index,
  require => File['/var/www/cookbook'],
}
