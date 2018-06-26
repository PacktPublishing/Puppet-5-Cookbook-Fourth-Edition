class mysql (
  Integer $port,
  String $socket,
  Variant[String,Array[String]] $package
  ) {
    notify {"Port: ${port} Socket: ${socket} Package: ${package}": }
  }
