#$password = "pass"
$password = "password"
$valid_password = assert_type(String[8],$password)

notify {"v=${valid_password}": }
