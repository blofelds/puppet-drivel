# yum plugin for infra box
class yum_plugin {

    package { 'yum-plugin-downloadonly':
      ensure => 'installed',

    }
}
