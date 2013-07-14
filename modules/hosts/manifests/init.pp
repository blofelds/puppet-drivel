class hosts {
    file { 'hosts':
        path    => '/etc/hosts',
        ensure  => 'present',
        source  => 'puppet:///modules/hosts/hostsfile',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }
}

class securehosts {
    file { 'securehosts':
        path    => '/etc/hosts',
        ensure  => 'present',
        source  => 'puppet:///modules/hosts/securehostsfile',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }
}
