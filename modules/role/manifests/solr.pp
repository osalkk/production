class role::solr {
  include yum
  include wget
  Class['yum'] -> Class['wget']
  account {
    'solr':
      home_dir => '/home/solr',
      groups   => [ 'wheel' ],
      password => '$6$0hA2AT5I$KPHiddyTKO1y75Cl.e.FNCvBQ3oxjJlY5JBNaHWHjTnC5SyKCBf9m2Ot18.LASqx/vzz.gW9IX4Z9gDxhU3Pl1',
      comment  => 'Solr user',
  }
  class {'epel':
    stage => 'pre',
  }
  class { 'java':
    distribution => 'jre',
  }
  service { 'iptables' :
    ensure => 'stopped',
    enable => 'false',
  }
  exec { 'solr-install':
    cwd => '/opt',
    command => '/usr/bin/wget http://apache.bilkent.edu.tr/lucene/solr/4.10.0/solr-4.10.0.tgz && /bin/tar xvzf solr-4.10.0.tgz && rm -rf solr-4.10.0.tgz && mv solr-4.10.0 solr && cd solr && mv example core ',
    creates => '/opt/solr',
    timeout => 0,
  }
  replace_matching_line { 'rootlogger':
    file => '/opt/solr/core/resources/log4j.properties',
    match => '=INFO',
    replace => '=WARN',
  }

  file { '/etc/init.d/solr':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '755',
    source => 'puppet:///modules/role/solr',
  }
  file { '/etc/rc.d/rc3.d/S20solr':
    ensure => link,
    target => '/etc/init.d/solr',
  }
}
