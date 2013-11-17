# installs puppet 3 repo
class repos::puppet3 {

    yumrepo { 'puppet3':
        name        => 'puppet3',
        baseurl     => 'http://infra1.org/dev/puppet3',
        descr       => 'puppet 3',
    }
}
