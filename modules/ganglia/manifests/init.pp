class ganglia {
}

class ganglia::host inherits ganglia {

    package { 'ganglia-gmond':
        ensure => 'installed',
    }
}

class ganglia::host::hadoop inherits ganglia::host {

    file { 'gmond.hadoop':
        require => Package['ganglia-gmond'],
        path    => "/etc/ganglia/gmond.conf",
        ensure  => 'present',
        source  => 'puppet:///modules/ganglia/gmond.hadoop',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }

    service { 'gmond':
        require => File['gmond.hadoop'],
        ensure  => 'running',
    }
}

class ganglia::host::infra inherits ganglia::host {

    file { 'gmond.infra':
        require => Package['ganglia-gmond'],
        path    => '/etc/ganglia/gmond.conf',
        ensure  => 'present',
        source  => 'puppet:///modules/ganglia/gmond.infra',
        group   => 'root',
        owner   => 'root',
        mode    => '0644',
    }

    service { 'gmond':
        require => File['gmond.infra'],
        ensure  => 'running',
    }
}


class ganglia::server inherits ganglia {
}
