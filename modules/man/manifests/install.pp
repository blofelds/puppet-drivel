#installs man pages package
class man::install{

  package { 'man':
    ensure => 'installed',
  }
}
