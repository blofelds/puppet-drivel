class base {

    include hosts
    include repos::all
    include ntp
    include vmwaretools
    include users
    include man
}

class base::infra inherits base {

    include ganglia::host::infra
}

class base::hadoop inherits base {

    include ganglia::host::hadoop
}
