# installs puppet 3 repo
class repos::puppet {

    yumrepo { 'puppet':
        name        => 'puppet',
        baseurl     => "http://${infra_server}/repo/puppet",
        descr       => 'puppet',
    }
}
