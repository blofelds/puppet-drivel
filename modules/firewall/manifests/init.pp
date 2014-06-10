class firewall {

  linux_firewall { 'resourceinstance1':
    name => 'testname',
    ensure => 'present',
    dest_ip => '10.2.2.2/32',
    source_ip => '10.2.3.4/32',
  }

  linux_firewall { 'resourceinstance2':
    name => 'anotherrule',
    ensure => 'present',
    dest_ip => '10.22.22.22/32',
    source_ip => '10.22.33.44/32',
  }

}
