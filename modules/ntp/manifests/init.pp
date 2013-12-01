# installs ntp package, conf file and runs 'ntpdate' against infra1.org
class ntp (
  $offline = 'default',
)

  inherits ntp::params {

  unless $offline == offline {


  }
}
