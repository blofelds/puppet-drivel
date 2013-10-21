# installs ntp packag
class ntp::install inherits ntp {

  package { 'ntp':
    ensure  => installed,
  }
}
