class puppet_pi_install::jobrunner {

  exec {'/usr/bin/gem install bundler':
    creates =>  "/usr/local/bin/bundler"
  }

  exec {'/bin/sh -c "cd /tmp && git clone https://github.com/mahnkong/rpi-jobrunner.git && cd rpi-jobrunner && bundle install && rake install && cd /tmp && rm -rf rpi-jobrunner"':
    require => Exec['/usr/bin/gem install bundler'],
    creates => "/usr/local/bin/jobrunner"
  }

  file {'/etc/systemd/system/jobrunner.service':
    ensure => present,
    content => template("puppet_pi_install/jobrunner/jobrunner.service"),
    notify =>  Exec['/bin/systemctl enable jobrunner.service']
  }

  exec {'/bin/systemctl enable jobrunner.service':
    refreshonly => true,
    notify      => Exec['/bin/systemctl start jobrunner.service']
  }

  exec {'/bin/systemctl start jobrunner.service':
    refreshonly => true,
  }

}
