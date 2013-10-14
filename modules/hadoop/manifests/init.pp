# installs hadoop and dependendies
class hadoop {

    package { 'jdk':
        ensure => 'installed',
    }
}

# installs hadoop datanode apps and dependendies
class hadoop::datanode inherits hadoop {

    package { 'hadoop-hdfs-datanode':
        ensure  => 'installed',
        require => [Package['jdk'],User['hdfs']],
    }

    package { 'hadoop-0.20-mapreduce-tasktracker':
        ensure  => 'installed',
        require => [Package['jdk'],User['mapred']],
    }

    group {
        'hdfs':
            ensure  => 'present';
        'mapred':
            ensure  => 'present',
    }

    user { 'hdfs':
        ensure      => 'present',
        require     => Group['hdfs'],
        gid         => 'hdfs',
        password    => '',
        comment     => 'hdfs user',
        home        => '/home/hdfs',
        shell       => '/bin/bash',
        managehome  => true,
    }

    user { 'mapred':
        ensure      => 'present',
        require     => Group['mapred'],
        gid         => 'mapred',
        password    => '',
        comment     => 'mapreduce user',
        home        => '/home/mapred',
        shell       => '/bin/bash',
        managehome  => true,
    }

    file {
        'datanodedir':
            ensure  => 'directory',
            path    => '/data/1/dfs',
            owner   => 'hdfs',
            group   => 'hdfs',
            mode    => '0775';
        '/data/1':
            ensure  => 'directory',
            owner   => 'hdfs',
            group   => 'hdfs',
            mode    => '0775';
        '/data':
            ensure  => 'directory',
            owner   => 'hdfs',
            group   => 'hdfs',
            mode    => '0775',
    }

    file { 'mapredlogdir':
        ensure  => 'directory',
        path    => '/var/log/hadoop-0.20-mapreduce',
        owner   => 'mapred',
        group   => 'hdfs',
        mode    => '0755',
    }

    file { 'datanodedir_1':
        ensure  => 'directory',
        require => File['datanodedir'],
        path    => '/data/1/dfs/dn',
        owner   => 'hdfs',
        group   => 'hdfs',
        mode    => '0700',
    }

    file { 'mapreddir':
        ensure  => 'directory',
        require => File['datanodedir'],
        path    => '/data/1/mapred',
        owner   => 'mapred',
        group   => 'hadoop',
        mode    => '0755',
    }

    file {
        'conf':
            ensure  => 'present',
            path    => '/etc/hadoop/conf/core-site.xml',
            source  => 'puppet:///modules/hadoop/core-site.xml',
            owner   => 'root',
            group   => 'root',
            mode    => '0544';
        'conf-mapred':
            ensure  => 'present',
            path    => '/etc/hadoop/conf/mapred-site.xml',
            source  => 'puppet:///modules/hadoop/mapred-site.xml',
            owner   => 'root',
            group   => 'root',
            mode    => '0544';
        'conf-hdfs':
            ensure  => 'present',
            path    => '/etc/hadoop/conf/hdfs-site.xml',
            source  => 'puppet:///modules/hadoop/hdfs-site.xml',
            owner   => 'root',
            group   => 'root',
            mode    => '0544';
    }

    service { 'hadoop-0.20-mapreduce-tasktracker':
        ensure  => 'running',
        require => [Package['hadoop-0.20-mapreduce-tasktracker'],
            File[mapreddir]],
    }

    service { 'hadoop-hdfs-datanode':
        ensure  => 'running',
        require => [Package['hadoop-hdfs-datanode'],
            File['datanodedir_1']],
    }
}

# holding class
class hadoop::namenode inherits hadoop {

}
