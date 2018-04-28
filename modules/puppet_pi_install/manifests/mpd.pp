class puppet_pi_install::mpd {
  package {'mpd':, ensure => "installed"}
  package {'mpc':, ensure => "installed"}

  file {'/etc/mpd.conf':
    ensure =>  present,
    notify =>  Exec['/bin/systemctl stop mpd'],
    source =>  "puppet:///modules/puppet_pi_install/mpd/mpd.conf",
  }

  file {'/etc/asound.conf':
    ensure =>  present,
    notify =>  Exec['/bin/systemctl stop mpd'],
    source =>  "puppet:///modules/puppet_pi_install/mpd/asound.conf",
  }

  exec {'/bin/systemctl stop mpd':
    refreshonly => true,
    notify      =>  Exec['/bin/systemctl start mpd']
  }

  exec {'/bin/systemctl start mpd':
    refreshonly =>  true,
  }

}
