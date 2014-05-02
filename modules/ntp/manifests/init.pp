# installs ntp package, conf file and runs 'ntpdate' against infra1.org
class ntp (
$infraserver  = undef,
$update       = undef,
){

    anchor { 'ntp::begin': } ->
    class { '::ntp::install': } ->
    class { '::ntp::config': } ~>
    class { '::ntp::service': } ->
    anchor { 'ntp::end': }

}
