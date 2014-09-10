
include stages

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

  class wget {
    package {'wget':
      ensure => present,
    }
  }

  class {'solr':
    contain wget
  }
  
  class { 'java':
    distribution => 'jre',
  }
  
  Package['wget'] -> Class['java'] -> Class['solr']
   
  service { 'iptables' :
    ensure => 'stopped',
    enable => 'false',
  }
}
