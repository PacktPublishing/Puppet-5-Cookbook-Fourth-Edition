node default {
  $devel = @(DEVEL)
    Good-bye world!
    This is development
    | DEVEL
  file {'/tmp/devel':
    content => $devel,
  }
}
