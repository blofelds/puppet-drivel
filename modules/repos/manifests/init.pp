# sets class-wide variables for use in scope
class repos  {

  $yumrepos = hiera_hash('yumrepos')
  create_resources('repos::yumrepos', $yumrepos)
}
