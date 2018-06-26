class apache {
  File {
    owner => 'apache',
    group => 'apache',
    mode  => 0644,
  }
  package {'httpd': ensure => 'installed' }

  $index = @(INDEX)
    <html>
      <body>
        <h1><a href='cookbook.html'>Cookbook! </a></h1>
      </body>
    </html>
    | INDEX
  file {'/var/www/html/index.html':
    content => $index,
  }

  $cookbook = @(COOKBOOK)
    <html>
      <body>
        <h2>PacktPub</h2>
      </body>
    </html>
    | COOKBOOK
  file {'/var/www/html/cookbook.html':
    content => $cookbook
  }
}
