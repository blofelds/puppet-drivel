class ntp {

    package { 'ntp':
        require => Class['repos'],
        ensure  => 'installed',
    }

    file { 'ntp.conf':
        require =>  Package['ntp'],
        path    => '/etc/ntp.conf',
        ensure  => 'present',
        source  => 'puppet:///modules/ntp/ntp.conf',
        group   => 'root',
        owner   => 'root',
        mode    => '0400',
    }

    exec { 'update date':
        require => Package['ntp'],
        command => '/usr/sbin/ntpdate infra1.org',
        onlyif  => "/etc/init.d/ntpd status | grep stopped"
    }


    service { 'ntpd':
        require => Exec['update date'],
        ensure  => running,
    }
}

