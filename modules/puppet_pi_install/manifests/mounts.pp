class puppet_pi_install::mounts {
  file { '/mnt/hdd':
    ensure => 'directory',
  }

  file {'/etc/fstab':
    ensure => present,
    source => "puppet:///modules/puppet_pi_install/fstab/fstab",
  }
}
