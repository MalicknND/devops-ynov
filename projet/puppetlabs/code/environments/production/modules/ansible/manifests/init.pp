# Classe ansible
class ansible() {
  apt::ppa { 'ppa:ansible/ansible': }

  class { 'ansible::install':
    require => Apt::Ppa['ppa:ansible/ansible'],
    notify  => Class['ansible::config'],
  }

  class { 'ansible::config': }
}
