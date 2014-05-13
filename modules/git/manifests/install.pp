# installs git package
class git::install {

  package { 'git':
    require => Class['base'],
    ensure  => 'installed',
  }
}
