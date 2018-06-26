$lunch = 'Filet mignon.' $lunchtype = $lunch ? {
  /fries/ => 'unhealthy',
  /salad/ => 'healthy',
  default => 'unknown',
}
notify { "Your lunch was ${lunchtype}": }
