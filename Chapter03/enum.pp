$state = 'install'
$pkg = assert_type(Enum['installed','absent'], $state) 
