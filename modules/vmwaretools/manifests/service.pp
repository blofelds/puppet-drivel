# starts vmware tools service
class vmwaretools::service {

  service { 'vmware-tools':
    ensure  => $vmwaretools::service_ensure,
    require => Package['vmware-tools'],
  }
}
