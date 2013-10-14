# installs ntp package, conf file and runs 'ntpdate' against infra1.org
class ntp {

    package { 'ntp':
        ensure  => 'installed',
        require => Class['repos::all'],
    }

    file { 'ntp.conf':
        ensure  => 'present',
        require =>  Package['ntp'],
        path    => '/etc/ntp.conf',
        source  => 'puppet:///modules/ntp/ntp.conf',
        group   => 'root',
        owner   => 'root',
        mode    => '0400',
    }

    exec { 'update date':
        require => File['ntp.conf'],
        command => '/usr/sbin/ntpdate infra1.org',
        onlyif  => '/etc/init.d/ntpd status | grep stopped'
    }


    service { 'ntpd':
        ensure  => running,
        require => Exec['update date'],
    }
}
