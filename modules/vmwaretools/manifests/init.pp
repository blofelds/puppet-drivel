# installs vmware adn restarts service
class vmwaretools  (
  $offline = 'default',
) {

  unless $offline == offline {

  if $::is_vagrant == false {
    package { 'vmware-tools':
        ensure  => 'installed',
    }

    service { 'vmware-tools':
        ensure  => 'running',
        require => Package['vmware-tools'],
    }
  }

  else {}
}
