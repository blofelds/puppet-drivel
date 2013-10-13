class repos  {        
    Yumrepo {         
      require        => Class['hosts'],
      enabled         => '1',
      gpgcheck        => '0',
      priority        => '1',
      metadata_expire => '1',
    }
}

class repos::all inherits repos {
    
    include repos::tools
    include repos::java
    include repos::ganglia
    include repos::vmware-tools

    $file_name      = [  "/etc/yum.repos.d/CentOS-Base.repo", "/etc/yum.repos.d/CentOS-Debuginfo.repo", "/etc/yum.repos.d/CentOS-Media.repo", "/etc/yum.repos.d/CentOS-Vault.repo" ]

    file { $file_name:
      ensure        => 'absent',
    }
}

#not sure if infra box needs these repos or not
class repos::infra inherits repos {
    
    include repos::tools
    include repos::java
    include repos::ganglia
    include repos::vmware-tools
}

class repos::ganglia {

    yumrepo { 'ganglia':
        name        => 'ganglia',
        baseurl     => 'http://infra1.org/repo/ganglia',
        descr       => 'ganglia repo',
    }
}   

class repos::java {

    yumrepo { 'java':
        name        => 'java',
        baseurl     => 'http://infra1.org/repo/java',
        descr       => 'java bits',
    }
}

class repos::tools {

    yumrepo { 'tools':
        name        => 'tools',
        baseurl     => 'http://infra1.org/repo/tools',
        descr       => 'generalbits',
    }
}

class repos::vmware-tools {

    yumrepo { 'vmware-tools':
        name        => 'vmware-tools',
        baseurl     => 'http://infra1.org/repo/vmware-tools',
        descr       => 'vmware',
    }
}
