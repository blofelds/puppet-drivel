# add various users
class users (
  $secure_root_password = 'securepass',
  $secure_host = 'true',
) {

  if $secure_host == 'true' {
    user { 'root':
      ensure     => 'present',
      gid        => '0',
      comment    => 'rooty root',
      managehome => false,
      password   => $secure_root_password,
    }
  }
}
# secure_host variable may need to be single quoted to pass the tests
