# defines the hosts::entries type to allow hiera data to create hosts
define hosts::entries(
$host = $title,
$ip = '0.0.0.0'
){
  host { $title:
    ip => $ip,
  }
}
