# carries out an ntpdate update and starts ntp service
class ntp::service {

  service { 'ntpd':
    ensure  => running,
    enable  => true,
  }
}
