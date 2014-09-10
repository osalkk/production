class host::webservers {
  include host::virtual
  realize(Host['www.wekanban.com'])
}
