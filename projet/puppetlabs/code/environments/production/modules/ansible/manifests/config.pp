# Classe ansible::config
class ansible::config() {
  file { '/etc/ansible/hosts':
    ensure => 'present',
    source => 'puppet:///modules/ansible/hosts',
  }

  file { '/etc/ansible/playbooks':
    ensure  => 'directory',
    recurse => true,
    source  => 'puppet:///modules/ansible/playbooks',
  }
}
