# sets class-wide variables for use in scope
class repos  {
    Yumrepo {
      enabled         => '1',
      gpgcheck        => '0',
      priority        => '1',
      metadata_expire => '1',
    }
}

# removes all CentOS repos, inherits all other repos
class repos::all inherits repos {

    include repos::tools
    include repos::java
    include repos::ganglia
    include repos::vmware_tools

    $file_name      = [  '/etc/yum.repos.d/CentOS-Base.repo',
    '/etc/yum.repos.d/CentOS-Debuginfo.repo',
    '/etc/yum.repos.d/CentOS-Media.repo',
    '/etc/yum.repos.d/CentOS-Vault.repo' ]

    file { $file_name:
      ensure        => 'absent',
    }
}

#not sure if infra box needs these repos or not
class repos::infra inherits repos {

    include repos::tools
    include repos::java
    include repos::ganglia
    include repos::vmware_tools
}

# installs ganglia repo
class repos::ganglia {

    yumrepo { 'ganglia':
        name        => 'ganglia',
        baseurl     => 'http://infra1.org/repo/ganglia',
        descr       => 'ganglia repo',
    }
}

# installs java repo
class repos::java {

    yumrepo { 'java':
        name        => 'java',
        baseurl     => 'http://infra1.org/repo/java',
        descr       => 'java bits',
    }
}

# installs tools repo
class repos::tools {

    yumrepo { 'tools':
        name        => 'tools',
        baseurl     => 'http://infra1.org/repo/tools',
        descr       => 'generalbits',
    }
}

# installs vmware_tools repo
class repos::vmware_tools {

    yumrepo { 'vmware_tools':
        name        => 'vmware_tools',
        baseurl     => "http://{$infra_server}/repo/vmware-tools",
        descr       => 'vmware',
    }
}
