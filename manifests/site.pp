
class stages {
  stage { 'pre':
    before => Stage['main'],
  }
}


node 'server-1.wekanban.com' {
  include role::general
  #include role::www:dev
}




node 'server-2.wekanban.com' {
  account {
    'solr':
      home_dir => '/home/solr',
      groups   => [ 'wheel' ],
      password => 'solr@2015',
      comment  => 'Solr user',
  }
  
  class {'epel':
    stage => 'pre',
  }
  include solr
  
  class { 'java':
    distribution => 'jre',
  }

  service { 'iptables' :
    ensure => 'stopped',
    enable => 'false',
  }
}
