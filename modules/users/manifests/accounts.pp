# add various users
define users::accounts(
$username = $title,
$password = '!',
) {

  user { $title:
      ensure  => 'present',
      password  => $password,
  }
}