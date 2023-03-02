# @summary A short summary of the purpose of this define
#
# A description of what this define does
#
# @example
#   zsh::ohmyzsh::addons
define zsh::ohmyzsh::addons (
  String               $ensure,
  String               $home,
  Hash[String, String] $plugins,
  Hash[String, String] $themes,
  String               $username,
) {
  if $caller_module_name != $module_name {
    fail("Use of private define ${name} by ${caller_module_name}")
  }

  if $ensure == 'present' {
    $plugins.each |String $name, String $url| {
      if $url != '' {
        vcsrepo { "${name} for ${username}":
          ensure   => $ensure,
          path     => "${home}/.oh-my-zsh/custom/plugins/${name}",
          provider => git,
          source   => $url,
          user     => $username
        }
      }
    }

    $themes.each |String $name, String $url| {
      if $url != '' {
        vcsrepo { "${name} for ${username}":
          ensure   => $ensure,
          path     => "${home}/.oh-my-zsh/custom/themes/${name}",
          provider => git,
          source   => $url,
          user     => $username,
        }
      }
    }
  }
}
