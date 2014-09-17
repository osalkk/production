import 'stages.pp'

node 'server-1.wekanban.com' {
  include stages
  include yum
  include role::general
  #include role::www:dev
}

node 'server-2.wekanban.com' {
  include stages
  include role::solr
}
