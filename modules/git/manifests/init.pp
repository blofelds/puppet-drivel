# installs git package
class git {

  anchor { 'git::begin': } ->
  class { 'git::install': } ->
  anchor { 'git::end': }
}
