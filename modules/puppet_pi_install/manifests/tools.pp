class puppet_pi_install::tools {

  package {'git': ensure  => "installed" }
  package {'vim': ensure  => "installed" }
}
