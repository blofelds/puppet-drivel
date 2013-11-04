# installs tools repo
class repos::tools {

    yumrepo { 'tools':
        name        => 'tools',
        baseurl     => 'http://infra1.org/repo/tools',
        descr       => 'generalbits',
    }
}
