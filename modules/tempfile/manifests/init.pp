class onur {
  file {'/tmp/onur':
    ensure => file,
    content => "selam\n",
  }
}
