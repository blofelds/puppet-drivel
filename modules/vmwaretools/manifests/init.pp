# installs vmware adn restarts service
class vmwaretools {

    package { 'vmware-tools':
        ensure  => 'installed',
        require => Class['repos::all'],
    }

    service { 'vmware-tools':
        ensure  => 'running',
        require => Package['vmware-tools'],
    }
}
