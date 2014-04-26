# defines the hosts::entries type to allow hiera data to create hosts
define hosts::entries(
$host = $title,
$ip = $ip
){
  host { $title:
    ip => $ip
  }
}
