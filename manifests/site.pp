class stages {
  stage { 'pre':
    before => Stage['main'],
  }
}

include stages

node 'server-1.wekanban.com' {
  include yum
  include role::general
  #include role::www:dev
}




node 'server-2.wekanban.com' {
  include yum
  include wget
  Class['yum'] -> Class['wget']
  class {'tempfile':}
  account {
    'solr':
      home_dir => '/home/solr',
      groups   => [ 'wheel' ],
      password => '$6$0hA2AT5I$KPHiddyTKO1y75Cl.e.FNCvBQ3oxjJlY5JBNaHWHjTnC5SyKCBf9m2Ot18.LASqx/vzz.gW9IX4Z9gDxhU3Pl1',
      comment  => 'Solr user',
  }

  include epel
  
  class { 'java':
    distribution => 'jre',
  }

  service { 'iptables' :
    ensure => 'stopped',
    enable => 'false',
  }

}

