import 'base.pp'

node ganglia {
    include hosts
}

node infra1 {
   # include base
    include git
}

node puppet {
    include base::infra
}

node host5 {
    include base::hadoop
}

node host6 {
    include base::hadoop
}
