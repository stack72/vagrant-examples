exec { "apt-get-update":
    command => "/usr/bin/apt-get update",
}

package {'curl':
	provider => apt,
	ensure => latest,
	require => Exec['apt-get-update']
}

class {'elasticsearch':
  version => '0.90.0',
  require => Exec['apt-get-update'],
}