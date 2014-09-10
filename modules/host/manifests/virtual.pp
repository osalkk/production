class host::virtual {
@host{'www.wekanban.com':
  ensure => present,
  ip => '192.186.251.230',
  target => '/etc/hosts',
}
}
