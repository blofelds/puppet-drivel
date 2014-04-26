# creates host resources
class hosts 
{
  $hostentries = hiera_hash('hostentries')
  create_resources('hosts::entries', $hostentries)
}
