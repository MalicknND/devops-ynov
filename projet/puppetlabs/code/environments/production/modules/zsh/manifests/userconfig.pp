# @summary A short summary of the purpose of this define
#
# A description of what this define does
#
# @example
#   zsh::userconfig
define zsh::userconfig (
  String $home,
  String $ohmyzsh_ensure,
  Hash   $ohmyzsh_plugins,
  String $username,
  String $theme = 'agnoster',
) {
  if $caller_module_name != $module_name {
    fail("Use of private define ${name} by ${caller_module_name}")
  }

  file { "${username} .zshrc":
    ensure  => 'file',
    path    => "${home}/.zshrc",
    owner   => $username,
    group   => $username,
    mode    => '0644',
    content => epp('zsh/.zshrc.epp', {
      home            => $home,
      ohmyzsh_ensure  => $ohmyzsh_ensure,
      ohmyzsh_plugins => keys($ohmyzsh_plugins),
      theme           => $theme,
    }),
  }

  file { "${username} .zsh":
    ensure => 'directory',
    path   => "${home}/.zsh",
    owner  => $username,
    group  => $username,
  }

  file { "${username} aliases.sh":
    ensure => 'file',
    path   => "${home}/.zsh/aliases.sh",
    owner  => $username,
    group  => $username,
    mode   => '0644',
    source => 'puppet:///modules/zsh/aliases.sh',
  }

  file { "${username} functions.sh":
    ensure => 'file',
    path   => "${home}/.zsh/functions.sh",
    owner  => $username,
    group  => $username,
    mode   => '0644',
    source => 'puppet:///modules/zsh/functions.sh',
  }
}
