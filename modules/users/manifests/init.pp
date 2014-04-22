# add various users
define users(
$username = $title,
$password = '!',
) {

  user { $title:
      ensure  => 'present',
      password  => $password,
  }
}
# secure_host variable may need to be single quoted to pass the tests
