class puppet_pi_install::backup {

  $rclone_version = "v1.41"

  package {'borgbackup':, 
    ensure => "installed",
  }

  exec {"/bin/sh -c 'cd /tmp && /usr/bin/wget --no-check-certificate http://downloads.rclone.org/${rclone_version}/rclone-${rclone_version}-linux-arm.zip && /usr/bin/unzip rclone-${rclone_version}-linux-arm.zip && /bin/cp ./rclone-${rclone_version}-linux-arm/rclone /usr/sbin/rclone-${rclone_version} && /bin/rm -rf rclone-${rclone_version}'":
    creates => "/usr/sbin/rclone-${rclone_version}"
  }

  file { "/usr/sbin/rclone-${rclone_version}":
    mode =>  '0755',
  }

  file { '/usr/sbin/rclone':
    ensure => 'link',
    target => "/usr/sbin/rclone-${rclone_version}"
  }

  file { "/home/pi/.config/rclone":
    ensure => "directory"
  }

  file { "/home/pi/.config/rclone/rclone.conf":
    source => "${::private_conf_sources_dir}/rclone/rclone.conf"
  }
}
