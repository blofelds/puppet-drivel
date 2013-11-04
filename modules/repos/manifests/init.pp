# sets class-wide variables for use in scope
class repos  {
    Yumrepo {
      enabled         => '1',
      gpgcheck        => '0',
      priority        => '1',
      metadata_expire => '1',
    }
}
