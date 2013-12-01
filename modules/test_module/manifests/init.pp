# test module which places a file

class test_module (
  $testvar = 'default text',
  $offline = 'test',
) {

  unless $offline == offline {

    file { 'test1':
        ensure  => file,
        path    => '/var/tmp/test1file',
        content => $testvar,
  }

    notice ("this is the fully qualified notice line......${test_module::testvar} blah")
    notice ("this is the notice line......${testvar} blah")
 
    notify {'test message fuly qualified':
      withpath => false,
      name     => " this is the fully qualified notify line........ $test_module::testvar blah",
    }

    notify {'test message':
      withpath => false,
      name     => " this is the notify line........ $testvar blah",
    }
  }
}
