class vmwaretools {

    package { 'vmware-tools':
        require => Class['repos'],
        ensure => 'installed',
    }

    service { 'vmware-tools':
        require => Package['vmware-tools'],
        ensure => 'running',
    }
}
