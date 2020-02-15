class puppet_pi_install_fsro::fs_ro {
  package {'triggerhappy':, ensure => "absent"}
  package {'logrotate':, ensure => "absent"}
  package {'dphys-swapfile':, ensure => "absent"}
  package {'rsyslogd':, ensure => "absent"}
  package {'busybox-syslogd':, ensure => "installed"}

  file {'/lib/systemd/system/systemd-random-seed.service':
    ensure =>  present,
    notify =>  Exec['systemd-random-seed systemctl daemon-reload'],
    source =>  "puppet:///modules/puppet_pi_install_fsro/fs_ro/systemd-random-seed.service",
  }
  file {'/tmp/fs_ro.sh':
    ensure =>  present,
    notify =>  Exec['/bin/bash /tmp/fs_ro.sh'],
    source =>  "puppet:///modules/puppet_pi_install_fsro/fs_ro/fs_ro.sh",
  }
  exec {'systemd-random-seed systemctl daemon-reload':
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  }
  exec {'/bin/bash /tmp/fs_ro.sh':
    refreshonly => true,
  }

}
