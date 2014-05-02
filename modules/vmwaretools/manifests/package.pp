# installs vmware package
class vmwaretools::package {

  package { 'vmware-tools':
      ensure  => 'installed',
  }
}
