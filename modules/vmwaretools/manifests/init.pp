# installs vmware adn restarts service
class vmwaretools {

    package { 'vmware-tools':
        ensure  => 'installed',
    }

    service { 'vmware-tools':
        ensure  => 'running',
        require => Package['vmware-tools'],
    }
}
