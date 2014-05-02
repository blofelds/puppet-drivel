# starts vmware tools service
class vmwaretools::service {

  service { 'vmware-tools':
    ensure  => 'running',
    require => Package['vmware-tools'],
  }
}
