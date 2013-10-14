class vmwaretools {

    package { 'vmware-tools':
        require => Class['repos::all'],
        ensure => 'installed',
    }

    service { 'vmware-tools':
        require => Package['vmware-tools'],
        ensure => 'running',
    }
}
