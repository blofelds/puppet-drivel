#not sure if infra box needs these repos or not
class repos::install::infra inherits repos {

    include repos::tools
    include repos::java
    include repos::ganglia
    include repos::vmware_tools
}
