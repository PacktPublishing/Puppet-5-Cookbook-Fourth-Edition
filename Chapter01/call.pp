if versioncmp($::puppetversion,'4.0') {
 $func = 'lookup'
} else {
 $func = 'hiera'
}
$val = call($func,'important_setting')
notify {"\$val = $val, \$func = $func": }
