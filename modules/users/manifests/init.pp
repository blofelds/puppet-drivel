# user accounts
class users {

  $useraccounts = hiera_hash('hiera_users')
  create_resources('users::accounts', $useraccounts)
}