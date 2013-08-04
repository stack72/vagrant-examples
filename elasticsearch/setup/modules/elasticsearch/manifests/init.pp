class elasticsearch ($version) {

	file {'/tmp/elasticsearch.deb':
		source => "puppet:///modules/elasticsearch/elasticsearch-${version}.deb",
	}

	package {'openjdk-7-jre-headless':
		provider => apt,
		ensure => latest,
	}

	package {'elasticsearch':
		provider => dpkg,
		ensure => latest,
        source => '/tmp/elasticsearch.deb',
		require => [Package['openjdk-7-jre-headless'],File['/tmp/elasticsearch.deb']],
	}

}