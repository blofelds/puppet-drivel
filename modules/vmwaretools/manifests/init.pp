# installs vmware adn restarts service
class vmwaretools {

  anchor { 'vmwaretools::begin': } ->
  class { 'vmwaretools::package': } ->
  class { 'vmwaretools::service': } ->
  anchor { 'vmwaretools::end': }

}
