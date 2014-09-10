#General settings for all servers
class role::general {
  class { '::ntp':
    servers => hiera('ntp::ntp_servers')
  }
  
  class { 'resolver':
    dns_servers => hiera(global_dns_servers),
  }
  
  class {'::vim':}
  class {'::tree':}
  
  
  $sysadmins = hiera('accounts_system')
  $developers = hiera('accounts_developer')
  create_resources('account', $sysadmins)
  create_resources('account', $developers)

  
  class {'ssh::server':
    options => {
      'RSAAuthentication'    => 'yes',
      'PubkeyAuthentication' => 'yes',
      'X11Forwarding'        => 'no',
    },
  }
  
  file { '/etc/sudoers':
    ensure  => present,
    content => hiera('sudoers'),
  }
  

  }
  
}
