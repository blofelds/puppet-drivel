# sets class-wide variables for use in scope
class repos  {

  anchor { 'repos::begin': } ->
  class { 'repos::purge': }  ->
  class { 'repos::create': } ->
  class { 'repos::files': } ->
  anchor { 'repos::end': }

}
