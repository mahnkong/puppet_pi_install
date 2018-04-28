class puppet_pi_install::nginx {
  package {'nginx':, 
    ensure => "installed",
    notify =>  File['/etc/nginx/sites-enabled/mahnkong'],
  }

  file {'/etc/nginx/sites-enabled/mahnkong':
    ensure =>  present,
    notify =>  Exec['/bin/systemctl stop nginx'],
    source =>  "${::private_conf_sources_dir}/nginx/sites-enabled-mahnkong",
  }

  exec {'/bin/systemctl stop nginx':
    refreshonly => true,
    notify      =>  Exec['/bin/systemctl start nginx']
  }

  exec {'/bin/systemctl start nginx':
    refreshonly =>  true,
  }
}
