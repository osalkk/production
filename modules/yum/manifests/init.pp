class yum {
  file { '/etc/yum.conf':
    source => "puppet:///modules/yum/yum.conf",
  }
}
