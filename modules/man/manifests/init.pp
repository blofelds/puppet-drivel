class man {

    package { 'man':
      require =>  Class['repos::all'],
      ensure  => 'installed',
    }
}
