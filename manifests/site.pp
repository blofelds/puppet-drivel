#import 'base.pp'

node ganglia {
  include hosts
}

node infra1 {
  include base
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

node 'gstest.org' {
  include base
}

node 'lab-box64.org' {
  include users
}
