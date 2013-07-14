import *.pp

node puppet {
    include base::infra
}

node host6 {
    include base::hadoop
}

node ganglia {
    include hosts
}

