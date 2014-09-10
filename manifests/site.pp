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
      password => 'solr@2015',
      comment  => 'Solr user',
  }

  include epel
  


}

