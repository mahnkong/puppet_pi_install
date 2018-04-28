class puppet_pi_install::rpi_notifier {

  file {'/etc/systemd/system/rpi_notifier.service':
    ensure => present,
    content => template("puppet_pi_install/rpi_notifier/rpi_notifier.service"),
    notify =>  Exec['/bin/systemctl enable rpi_notifier.service']
  }

  exec {'/bin/systemctl enable rpi_notifier.service':
    refreshonly => true,
    notify      => Exec['/bin/systemctl restart rpi_notifier.service']
  }

  exec {'/bin/systemctl restart rpi_notifier.service':
    refreshonly => true,
  }

}
