class puppet_pi_install {
    include puppet_pi_install::mounts
    include puppet_pi_install::mpd
    include puppet_pi_install::sshd
    include puppet_pi_install::samba
    include puppet_pi_install::backup
    include puppet_pi_install::jobrunner
    include puppet_pi_install::rpi_notifier
}
