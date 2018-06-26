class debianlike {
  notify { 'Special manifest for Debian-like systems': }
}
class redhatlike {
  notify { 'Special manifest for RedHat-like systems': }
}
case $::operatingsystem {
  'Ubuntu', 'Debian': { include debianlike },
  'RedHat', 'Fedora', 'CentOS', 'Springdale': { include redhatlike }
  default: { notify { "I don't know what kind of system you have!": } }
}
