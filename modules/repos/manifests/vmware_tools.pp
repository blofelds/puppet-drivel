# installs vmware_tools repo
class repos::vmware_tools {

    yumrepo { 'vmware_tools':
        name        => 'vmware_tools',
        baseurl     => "http://${infra_server}/repo/vmware-tools",
        descr       => 'vmware',
    }
}
