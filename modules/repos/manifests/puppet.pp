# installs puppet 3 repo
class repos::puppet {

    yumrepo { 'puppet':
        name        => 'puppet',
        baseurl     => 'http://infra1.org/repo/puppet',
        descr       => 'puppet',
    }
}
