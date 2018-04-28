class puppet_pi_install::certbot {

  file { '/etc/letsencrypt':
    ensure => 'link',
    target => "${::letsencrypt_data_dir}"
  }

  package {'certbot':
    ensure  => "installed",
    require => File['/etc/letsencrypt']
  }
}
