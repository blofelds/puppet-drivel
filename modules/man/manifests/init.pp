# man pages base class 
class man{

  anchor { 'man::begin': } ->  
  class  { 'man::install': } ->  
  anchor { 'man::end': }
}
