# installs ganglia repo
class repos::ganglia {

    yumrepo { 'ganglia':
        name        => 'ganglia',
        baseurl     => "http://${infra_server}/repo/ganglia",
        descr       => 'ganglia repo',
    }
}
