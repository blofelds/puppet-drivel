# add various users
class users {

    user { 'root':
      ensure     => 'present',
      gid        => '0',
      comment    => 'rooty root',
      managehome => false,
    }
}
