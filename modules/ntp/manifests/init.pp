# installs ntp package, conf file and runs 'ntpdate' against infra1.org
class ntp (
  $offline = 'default',
)

inherits ntp::params {

  unless $offline == offline {

    anchor { 'ntp::begin': } ->
    class { '::ntp::install': } ->
    class { '::ntp::config': } ~>
    class { '::ntp::service': } ->
    anchor { 'ntp::end': }

  }
}
