class hadoop {

    package { 'jdk':
        ensure => 'installed',
    }
}

class hadoop::datanode inherits hadoop {

    package { 'hadoop-hdfs-datanode':
        require => Package['jdk'],
        require => User['hdfs'],
        ensure  => 'installed',
    }
    
    package { 'hadoop-0.20-mapreduce-tasktracker':
        require => Package['hadoop-hdfs-datanode'],
        require => User['mapred'],
        ensure  => 'installed',
    }

    group { 
        'hdfs':
            ensure  => 'present';
        'mapred':
            ensure  => 'present',
    }

    user { 'hdfs':
        require     => Group['hdfs'],
        ensure      => 'present',
        gid         => 'hdfs',
        password    => '',
        comment     => 'hdfs user',
        home        => '/home/hdfs',
        shell       => '/bin/bash',
        managehome  => 'true',
    }

    user { 'mapred':
        require     => Group['mapred'],
        ensure      => 'present',
        gid         => 'mapred',
        password    => '',
        comment     => 'mapreduce user',
        home        => '/home/mapred',
        shell       => '/bin/bash',
        managehome  => 'true',
    }

    file { 
        'datanodedir':
            path    => "/data/1/dfs",
            ensure  => 'directory',
            owner   => 'hdfs',
            group   => 'hdfs',
            mode    => '0775';
        "/data/1":
            ensure  => 'directory',
            owner   => 'hdfs',
            group   => 'hdfs',
            mode    => '0775';
        "/data":
            ensure  => 'directory',
            owner   => 'hdfs',
            group   => 'hdfs',
            mode    => '0775',
    }

    file { 'datanodedir_1':
        require => File['datanodedir'],
        path    => '/data/1/dfs/dn',
        ensure  => 'directory',
        owner   => 'hdfs',
        group   => 'hdfs',
        mode    => '0700',
    }
 
    file { 'mapreddir':
        require => File['datanodedir'],
        path    => '/data/1/mapred',
        ensure  => 'directory',
        owner   => 'mapred',
        group   => 'hadoop',
        mode    => '0755',
    }

    file { 
        'conf':
            path    => "/etc/hadoop/conf/core-site.xml",
            source  => 'puppet:///modules/hadoop/core-site.xml',
            ensure  => 'present',
            owner   => 'root',
            group   => 'root',
            mode    => '0544';
        'conf-mapred':
            path    => "/etc/hadoop/conf/mapred-site.xml",
            source  => 'puppet:///modules/hadoop/mapred-site.xml',
            ensure  => 'present',
            owner   => 'root',
            group   => 'root',
            mode    => '0544';
        'conf-hdfs':
            path    => "/etc/hadoop/conf/hdfs-site.xml",
            source  => 'puppet:///modules/hadoop/hdfs-site.xml',
            ensure  => 'present',
            owner   => 'root',
            group   => 'root',
            mode    => '0544';
    }
        
        
    service { 'hadoop-0.20-mapreduce-tasktracker':
        require => [Package['hadoop-0.20-mapreduce-tasktracker'],
            File[mapreddir]],
        ensure  => 'running',
    }

    service { 'hadoop-hdfs-datanode':
        require => [Package['hadoop-hdfs-datanode'],
            File['datanodedir_1']],
        ensure  => 'running',
    }
}

class hadoop::namenode inherits hadoop {

}
