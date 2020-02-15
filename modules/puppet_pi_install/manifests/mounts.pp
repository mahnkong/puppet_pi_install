class puppet_pi_install::mounts {
  file { '/mnt/hdd':
    ensure => 'directory',
  }

  exec {'create links to ram directories':
    command => 'for dir in /var/lib/dhcp /var/spool /var/lock; do rm -rf $dir; ln -fs /tmp $dir; done',
    provider => 'shell'
  }

  file {'/etc/fstab':
    ensure => present,
    source => "puppet:///modules/puppet_pi_install/fstab/fstab",
  }
}
