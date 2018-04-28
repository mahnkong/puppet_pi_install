class puppet_pi_install::mounts {
  file { '/mnt/usb':
    ensure => 'directory',
    notify =>  Exec['/bin/mount -a']
  }
  file { '/mnt/hdd':
    ensure => 'directory',
    notify =>  Exec['/bin/mount -a']
  }
  file {'/etc/fstab':
    ensure => present,
    source => "puppet:///modules/puppet_pi_install/fstab/fstab",
    notify =>  Exec['/bin/mount -a']
  }
  exec {'/bin/mount -a':
    refreshonly =>  true,
  }
}
