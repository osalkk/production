Package {  allow_virtual => false, }

class base {
  include sudo
  include tree
  include vim
  class { '::ntp':
  servers => [ '0.tr.pool.ntp.org', '1.tr.pool.ntp.org' ],
  }
}

node 'server-1' {
  class {'base':}
  class {'motd':}
}

node 'server-2' {
  $ntpservers=hiera(ntp::ntp_servers)
  class { '::ntp':
  servers => $ntpservers,
  }

  $dnsserverlist=hiera(dns_servers)
  $subnet=$network_eth0
  $yshq_dns=$dnsserverlist['yshq']
  $yssol_dns=$dnsserverlist['yssol']
  
  if $subnet == '192.168.134.0' {
  $dns_servers=$yshq_dns
  } else {
   $dns_servers= $yssol_dns
  }
  class { 'resolver': 
  dns_servers => $dns_servers,
  search      => [ 'example42.com' , 'example42.lan' ],
}
 
  file { '/etc/sudoers':
    ensure => present,
    content => hiera('sudoers'),
  }


  file { '/etc/ssh/sshd_config':
    ensure => present,
    content => hiera('sshd_config'),
  }
}
