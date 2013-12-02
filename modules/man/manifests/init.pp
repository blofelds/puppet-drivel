# installs man pages
class man  (
  $offline = 'default',
) {

  unless $offline == offline {

    package { 'man':
      ensure  => 'installed',
    }
  }
}
