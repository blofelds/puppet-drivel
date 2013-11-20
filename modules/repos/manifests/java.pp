# installs java repo
class repos::java {

    yumrepo { 'java':
        name        => 'java',
        baseurl     => "http://${infra_server}/repo/java",
        descr       => 'java bits',
    }
}
