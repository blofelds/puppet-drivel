class firewall {

  firewall { 'resourceinstance1':
#    name => 'testname',
#    ensure => 'insync',
    file => '/var/tmp/testproperty',
    line => "bkjggkjg",
  }
}
