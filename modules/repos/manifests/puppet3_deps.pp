# installs puppet 3 dependencies repo
class repos::puppet3_deps {

    yumrepo { 'puppet3_deps':
        name        => 'puppet3_deps',
        baseurl     => 'http://infra1.org/dev/puppet3_deps',
        descr       => 'puppet 3 dependencies',
    }
}
