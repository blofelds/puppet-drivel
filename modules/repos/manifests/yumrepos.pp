#define and add yum repos
define repos::yumrepos(
$baseurl          = $baseurl,
$descr            = $descr,
$enabled          = '1',
$gpgcheck         = '0',
) {

  yumrepo { $title:
    enabled   => $enabled,
    gpgcheck  => $gpgcheck,
    baseurl   => $baseurl,
    descr     => $descr,
  }
}
