# adds ntp conf file and updates date only if service is stopped.
class ntp::config inherits ntp {

  file { 'ntp.conf':
    ensure  => present,
    require => Package['ntp'],
    path    => '/etc/ntp.conf',
    source  => 'puppet:///modules/ntp/ntp.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
  }

exec { 'update date':
  require => File['ntp.conf'],
  command => '/usr/sbin/ntpdate infra1.org',
  onlyif  => '/etc/init.d/ntpd status | grep stopped',
  }
}
