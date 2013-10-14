class base {

    include hosts
    include repos::all
    include ntp
    include vmwaretools
    include users
    include man
}

# base class with ganglia group for infrastructure nodes
class base::infra inherits base {

    include ganglia::host::infra
}

# base class with ganglia group for hadoop nodes
class base::hadoop inherits base {

    include ganglia::host::hadoop
}
