import 'base.pp'

node ganglia {
    $infra_server = 'infra1.org'
    include hosts
}

node infra1 {
  # include base
    include git
}

node puppet {
    $infra_server = 'infra1.org'
    include base::infra
}

node nagios {
    $infra_server = 'infra1.org'
    include base::infra
}

node host5 {
    include base::hadoop
    include hadoop::datanode
}

node host6 {
    include base::hadoop
}

node 'gstest.org' {
    $infra_server = '0.0.0.0'
    include hosts
}

node 'lab-box64.org' {
  include users
}
