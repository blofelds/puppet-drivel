# sets class-wide variables for use in scope
class repos  {

  anchor { 'repos::begin': }
  class { 'repos::create': }
  class { 'repos::files': }
  class { 'repos::purge': } 
  anchor { 'repos::end': }

}
