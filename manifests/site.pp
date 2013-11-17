import 'base.pp'

node ganglia {
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
    include base::infra
}

node host5 {
    include base::hadoop
    include hadoop::datanode
}

node host6 {
    include base::hadoop
}

node 'gstest03.dev.devops.id.bskyb.com' {
  include base
}
