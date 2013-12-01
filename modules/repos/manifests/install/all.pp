# removes all CentOS repos, inherits all other repos
class repos::install::all (
  $offline = 'default' 
)
  
  inherits repos {

  unless $offline == offline {

    anchor { 'repos::install::all::begin': } ->
    class { '::repos::tools': } ->
    class { 'repos::java': } ->
    class { 'repos::ganglia': } ->
    class { 'repos::vmware_tools': } ->
    class { 'repos::puppet': } ->
    anchor { 'repos::install::all::end': }

    $file_name      = [  '/etc/yum.repos.d/CentOS-Base.repo',
    '/etc/yum.repos.d/CentOS-Debuginfo.repo',
    '/etc/yum.repos.d/CentOS-Media.repo',
    '/etc/yum.repos.d/CentOS-Vault.repo' ]

    file { $file_name:
      ensure        => 'absent',
    }
  }
}
