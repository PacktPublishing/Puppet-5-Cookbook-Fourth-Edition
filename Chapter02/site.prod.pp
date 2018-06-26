node default {
  $production = @(PROD)
    Hello world!
    This is production
    | PROD
  file {'/tmp/production':
    content => $production,
  }
}
