# test module which places a file

class test_module ($testvar = "default text") {

    file { 'test1':
        ensure  => file,
        path    => "/var/tmp/test1file",
        content => $testvar,
  }

  #    file { 'test2':
  #        ensure  => 'present',
  #        path    => "/var/tmp/${::test_module::testvar}",
  #        content => hiera($testvar),
  #         content => "contents of testvar ${::test_module::testvar}",
  #  }

}

  #  notice ("this is the notice line......${test_module::testvar} blah")
  #  notice ("this is the notice line......${testvar} blah")
  #
  #  notify {'test message':
  #    withpath => false,
  #    name     => " this is the notify line........ $testvar blah",
  #  }
  #}
