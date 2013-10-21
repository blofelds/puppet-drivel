# carries out an ntpdate update and starts ntp service
class ntp::service inherits ntp {

  service { 'ntpd':
    ensure  => running,
    enable  => true,
  }
}
