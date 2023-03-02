# @summary Manages zsh and enventually Oh My Zsh! and some plugins linked to it
#
# This module allows the installation and configuration of zsh and can be used to add Oh My Zsh!
# to one or more users with specific configurations and / or modules
#
# @example
#   include zsh
class zsh (
  String      $package_ensure = 'present',
  String      $package_name   = 'zsh',
  Hash        $users_config   = {},
) {
  class { 'zsh::install':
    package_ensure => $package_ensure,
    package_name   => $package_name,
  }

  $users_config.each | $username, $params | {
    zsh::ohmyzsh::install { "Oh My Zsh! install for ${username}":
      ensure   => $params['ohmyzsh']['ensure'],
      home     => $params['home'],
      username => $username,
      require  => Class['zsh::install'],
    }

    zsh::ohmyzsh::addons { "Addons install for ${username}":
      ensure   => $params['ohmyzsh']['ensure'],
      home     => $params['home'],
      plugins  => $params['ohmyzsh']['plugins'],
      themes   => $params['ohmyzsh']['themes'],
      username => $username,
      require  => Zsh::Ohmyzsh::Install["Oh My Zsh! install for ${username}"],
    }

    zsh::userconfig { "User config for ${username}":
      home            => $params['home'],
      ohmyzsh_ensure  => $params['ohmyzsh']['ensure'],
      ohmyzsh_plugins => $params['ohmyzsh']['plugins'],
      theme           => $params['ohmyzsh']['theme'],
      username        => $username,
      require         => Class['zsh::install'],
    }
  }

  class { 'zsh::globalconfig':
    require => Class['zsh::install'],
  }
}
