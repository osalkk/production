class user::virtual {
@user { 'onursalk':
ensure => present,
shell => '/bin/bash',
}
@user { 'kaansalk':
ensure => present,
shell => '/bin/bash',
}
@user { 'onur':
  ensure           => 'present',
  comment          => 'puppet,,,',
  #gid              => '1000',
  groups           => ['adm','cdrom','sudo','dip','plugdev','lpadmin','sambashare'],
  home             => '/home/onur',
  password         => '$1$VAsrDEbm$HgbEyF3jvKqpwQ5izmMP5.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1000',
}

}
