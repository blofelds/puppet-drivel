# installs vmware and restarts service
class vmwaretools (
$service_ensure = 'running',
) {

  anchor { 'vmwaretools::begin': } ->
  class { 'vmwaretools::package': } ->
  class { 'vmwaretools::service': } ->
  anchor { 'vmwaretools::end': }

}
