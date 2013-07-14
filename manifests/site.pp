node puppet {
    include hosts
    include repos::all
    include ntp
    include vmwaretools
    include ganglia::host::infra
}

node host6 {
  include hosts
    include repos::all
    include ntp
    include vmwaretools
    include ganglia::host::hadoop
    include hadoop::datanode
    include users
}

node ganglia {
    include hosts
}

