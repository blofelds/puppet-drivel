# installs vmware adn restarts service
class vmwaretools  (
  $offline = 'default',
) {

  unless $offline == offline {

    package { 'vmware-tools':
        ensure  => 'installed',
    }

    service { 'vmware-tools':
        ensure  => 'running',
        require => Package['vmware-tools'],
    }
  }
}
