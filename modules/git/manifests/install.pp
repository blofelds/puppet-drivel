# installs git package
class git::install {

  package { 'git':
    ensure => 'installed',
  }
}
