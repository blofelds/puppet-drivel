# removes all CentOS repos, inherits all other repos
class repos::install::all inherits repos {

    anchor { 'repos::install::all::begin': } ->
    class { '::repos::tools': } ->
    class { 'repos::java': } ->
    class { 'repos::ganglia': } ->
    class { 'repos::vmware_tools': } ->
    class { 'repos::puppet3': } ->
    class { 'repos::puppet3_deps': } ->
    anchor { 'repos::install::all::end': }

    $file_name      = [  '/etc/yum.repos.d/CentOS-Base.repo',
    '/etc/yum.repos.d/CentOS-Debuginfo.repo',
    '/etc/yum.repos.d/CentOS-Media.repo',
    '/etc/yum.repos.d/CentOS-Vault.repo' ]

    file { $file_name:
      ensure        => 'absent',
    }
}
