class base {

    include hosts
    include repos::all
    include ntp
    include vmwaretools
    include users
}

class base::infra inherits base {

    include ganglia::host::infra
}

class base::hadoop inherits base {

    include ganglia::hosts::hadoop
}
