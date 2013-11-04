# installs ganglia repo
class repos::ganglia {

    yumrepo { 'ganglia':
        name        => 'ganglia',
        baseurl     => 'http://infra1.org/repo/ganglia',
        descr       => 'ganglia repo',
    }
}
