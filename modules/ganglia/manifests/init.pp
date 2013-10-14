# configure ganglia
class ganglia {
}

# installs gmond package
class ganglia::host inherits ganglia {

    package { 'ganglia-gmond':
        ensure => 'installed',
    }
}

# creates hadoop cluster host config file and starts gmond service
class ganglia::host::hadoop inherits ganglia::host {

    file { 'gmond.hadoop':
        ensure  => 'present',
        require => Package['ganglia-gmond'],
        path    => '/etc/ganglia/gmond.conf',
        source  => 'puppet:///modules/ganglia/gmond.hadoop',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }

    service { 'gmond':
        ensure  => 'running',
        require => File['gmond.hadoop'],
    }
}

# creates infrastructure cluster host config file and starts gmond service
class ganglia::host::infra inherits ganglia::host {

    file { 'gmond.infra':
        ensure  => 'present',
        require => Package['ganglia-gmond'],
        path    => '/etc/ganglia/gmond.conf',
        source  => 'puppet:///modules/ganglia/gmond.infra',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }

    service { 'gmond':
        ensure  => 'running',
        require => File['gmond.infra'],
    }
}

# holding class for ganglia server
class ganglia::server inherits ganglia {
}
