# places hosts file
class hosts {
    file { 'hosts':
        ensure  => 'present',
        path    => '/etc/hosts',
        source  => 'puppet:///modules/hosts/hostsfile',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }
}

# places minimal hosts file
class securehosts {
    file { 'securehosts':
        ensure  => 'present',
        path    => '/etc/hosts',
        source  => 'puppet:///modules/hosts/securehostsfile',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }
}
