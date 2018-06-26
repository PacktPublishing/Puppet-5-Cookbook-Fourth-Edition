define tmpfile (
  String $greeting = "Hello, World!\n"
  ) {
  file { "/tmp/${name}":
    content => $greeting,
  }
}

tmpfile { 'd': greeting => "Good Morning!\n" }
tmpfile { 'e': greeting => 10 }
