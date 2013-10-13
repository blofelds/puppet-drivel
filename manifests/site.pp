import 'base.pp'

node ganglia {
    include hosts
}

node nettest {
    include base
}

node infra1 {
   # include base
    include git
}

node puppet {
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
