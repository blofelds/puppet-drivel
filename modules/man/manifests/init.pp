# installs man pages
class man {

    package { 'man':
      ensure  => 'installed',
    }
}
