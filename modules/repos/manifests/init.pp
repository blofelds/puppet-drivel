# sets class-wide variables for use in scope
class repos  {

  file { '/etc/yum.repos.d':
    ensure  => 'directory',
    recurse => 'true',
    purge   => 'true',
  }

  $yumrepos = hiera_hash('yumrepos')
  create_resources('repos::yumrepos', $yumrepos)

  $repofiles = hiera_hash('yumrepos')
  create_resources('repos::repofiles', $repofiles)

}
