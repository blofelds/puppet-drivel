# create files 
class repos::files

  {
    $repofiles = hiera_hash('yumrepos')
    create_resources('repos::repofiles', $repofiles)
  }

