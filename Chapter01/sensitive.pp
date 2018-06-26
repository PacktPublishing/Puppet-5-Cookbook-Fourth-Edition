$secret = Sensitive('My Top Secret Password')
file {'/tmp/passwd':
  content => "${secret.unwrap}\n",
}
notice($secret)
