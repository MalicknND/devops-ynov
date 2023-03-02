# @summary Install zsh
#
# Installs the zsh package if it is configured to be present with the package_ensure parameter
#
# @param package_ensure
#   Ensure the package is present (installed), absent or a specific version.
#   Defaults to 'present'
#
# @api private
class zsh::install (
  $package_ensure,
  $package_name,
) {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $package_name != undef {
    package { $package_name:
      ensure => $package_ensure,
      alias  => 'zsh',
    }
  }
}
