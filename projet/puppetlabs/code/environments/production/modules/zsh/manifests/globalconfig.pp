# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zsh::globalconfig
class zsh::globalconfig {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { 'zshenv':
    ensure => 'file',
    path   => '/etc/zsh/zshenv',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/zsh/zshenv',
  }
}
