# installs ntp packag
class ntp::install inherits ntp {

  package { 'ntp':
    ensure  => installed,
    #    require => Class['repos::all'],
  }
}
