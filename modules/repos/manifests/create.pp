# create repos 
class repos::create
  {  $yumrepos = hiera_hash('yumrepos')
    create_resources('repos::yumrepos', $yumrepos)
  } 
