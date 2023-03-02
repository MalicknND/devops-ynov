# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include zsh::ohmyzsh::install
define zsh::ohmyzsh::install (
  String $ensure,
  String $home,
  String $username,
) {
  if $caller_module_name != $module_name {
    fail("Use of private define ${name} by ${caller_module_name}")
  }

  if !defined(Package[git]) {
    package { 'git':
      ensure => 'present',
    }
  }

  exec { "Oh My Zsh! install for ${username}":
    command     => '/bin/sh -c "$(/bin/wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -) --unattended"',
    environment => [ 'KEEP_ZSHRC=yes', "ZSH=${home}/.oh-my-zsh" ],
    path        => ['/usr/bin', '/usr/sbin',],
    creates     => "${home}/.oh-my-zsh",
    user        => $username,
  }
}
