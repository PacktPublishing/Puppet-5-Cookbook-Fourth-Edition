class eventmachine(
  String $version
  ) {
  package { 'eventmachine':
    provider => gem,
    ensure => $version,
  }
}
