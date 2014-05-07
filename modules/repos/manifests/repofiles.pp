#define and add the files for each yum repo
define repos::repofiles(
$baseurl          = $baseurl,
$descr            = $descr,
$enabled          = '1',
$gpgcheck         = '0',
) {

  file { "/etc/yum.repos.d/${title}.repo":
    ensure   => 'present',
  }
}
