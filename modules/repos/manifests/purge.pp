# purge repo folder
class repos::purge
 {
    file { '/etc/yum.repos.d':
      ensure  => 'directory',
      recurse => 'true',
      purge   => 'true',
    }
  }

