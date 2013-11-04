# installs hosts then repos then apps
class base {

    anchor { 'base::begin': } ->
    class { '::users': } ->
    class { '::hosts': } ->
    class { '::repos::install::all': } ->
    class { '::ntp': } ->
    class { '::vmwaretools': } ->
    class { '::man': } ->
    anchor { 'base::end': }
}

# base class with ganglia group for infrastructure nodes
class base::infra inherits base {

    include ganglia::host::infra
}

# base class with ganglia group for hadoop nodes
class base::hadoop inherits base {

    include ganglia::host::hadoop
}
