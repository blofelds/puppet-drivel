class firewall {

  linux_firewall { 'resourceinstance1':
    name => 'testname',
    ensure => 'present',
    dest_ip => '10.2.2.2/32',
    source_ip => '10.2.3.4/32',
  }
}
