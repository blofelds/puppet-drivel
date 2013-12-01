import 'base.pp'

node ganglia {
    $infra_server = 'infra1.org'
    include hosts
}

node nettest {
  $infra_server = localhost
  include base
}

node vagtest {
    $infra_server = 'infra1.org'
    include base
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

node gstest {
    $infra_server = '0.0.0.0'
    include test_module
}
