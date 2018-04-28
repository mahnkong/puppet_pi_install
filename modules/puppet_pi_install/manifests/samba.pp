class puppet_pi_install::samba {
  package {'samba':, 
    ensure => "installed",
    notify =>  File['/etc/samba/smb.conf'],
  }

  file {'/etc/samba/smb.conf':
    ensure =>  present,
    notify =>  Exec['/bin/systemctl stop smbd'],
    source =>  "${::private_conf_sources_dir}/samba/smb.conf",
  }

  exec {'/bin/systemctl stop smbd':
    refreshonly => true,
    notify      =>  Exec['/bin/systemctl start smbd']
  }

  exec {'/bin/systemctl start smbd':
    refreshonly =>  true,
  }

  notify {"Don't forget to add smbuser: sudo smbpasswd -a pi":
  }
}
