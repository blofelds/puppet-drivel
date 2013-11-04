# installs java repo
class repos::java {

    yumrepo { 'java':
        name        => 'java',
        baseurl     => 'http://infra1.org/repo/java',
        descr       => 'java bits',
    }
}
