
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
  include stages 
  class {'epel':
    stage => 'pre',
  }

  package {'wget':
    ensure => present,
  }

  include solr
  
  class { 'java':
    distribution => 'jre',
  }
  
  Package['wget'] -> Class['java'] -> Class['solr']
   
  service { 'iptables' :
    ensure => 'stopped',
    enable => 'false',
  }
}
