class tempfile {
  file {'/tmp/onur':
    ensure => file,
    content => "selam\n",
  }
}
