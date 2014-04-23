class users::accounts {

  $useraccounts = hiera_hash('hiera_users')
  create_resources('users', $useraccounts)
}
