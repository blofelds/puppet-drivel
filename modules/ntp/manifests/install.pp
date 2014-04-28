# installs ntp packag
class ntp::install {

  package { 'ntp':
    ensure  => installed,
  }
}
