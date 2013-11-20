# installs tools repo
class repos::tools {

    yumrepo { 'tools':
        name        => 'tools',
        baseurl     => "http://${infra_server}/repo/tools",
        descr       => 'generalbits',
    }
}
