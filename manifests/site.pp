class stages {
  stage { 'pre':
    before => Stage['main'],
  }
}

include stages

node 'server-1.wekanban.com' {
  include role::general
  #include role::www:dev
}




node 'server-2.wekanban.com' {
  include wget
  class {'tempfile':}
}

