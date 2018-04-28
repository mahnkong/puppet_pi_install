class puppet_pi_install::sshd {

  file {'/home/pi/.ssh': 
    ensure => directory,
    mode   => '0700',
    owner  =>  'pi',
    group  =>  'pi',
  }
  file {'/home/pi/.ssh/authorized_keys':
    ensure =>  present,
    source =>  "puppet:///modules/puppet_pi_install/ssh/authorized_keys",
    mode   =>  '0600',
    owner  =>  'pi',
    group  =>  'pi',
  }

  file {'/etc/ssh/sshd_config':
    ensure =>  present,
    notify =>  Exec['/bin/systemctl stop ssh'],
    source =>  "puppet:///modules/puppet_pi_install/ssh/sshd_config",
  }

  exec {'/bin/systemctl stop ssh':
    refreshonly => true,
    notify      =>  Exec['/bin/systemctl start ssh']
  }

  exec {'/bin/systemctl start ssh':
    refreshonly =>  true,
  }

}
