class admin::stages {
  stage { 'first':
    before => Stage['main']
  }
  stage { 'last':
    require => Stage['main']
  }

  class { 'admin::me_last':
    stage => 'last',
  }
  class { 'admin::me_first':
    stage => 'first',
  }
}
