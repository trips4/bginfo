class bginfo::file {
  # $bginfo_dir = 'c:/BGInfo'
  # $bginfo_config = "${bginfo_dir}/PuppetFacts.bgi"
  # $bginfo_dat = "${bginfo_dir}/PuppetBGInfo.dat"

  $bgi_cfg_file = 'PuppetFacts.bgi'
  $bgi_dat_file = 'PuppetBGInfo.dat'
  $bgi_dir      = 'BGInfo'
  $bgi_path     = 'c:/'

  file { "${bgi_path}${bgi_dir}":
    ensure => directory,
  }
  file { "${bgi_path}${bgi_dat_file}":
    ensure  => file,
    require => File["${bgi_path}${bgi_dir}"],
  }
  file { "${bgi_path}${bgi_cfg_file}":
    ensure  => file,
    source  => 'puppet:///modules/bginfo/PuppetFacts.bgi',
    require => File["${bgi_path}${bgi_dir}"],
  }

  $bginfo::displayed_facts.each |String $fact| {
    $fact_parts = $fact.split('[.]')
    $fact_value = dig($facts, *$fact_parts)

    file_line { "BGInfo Task ${fact_parts}":
      ensure => present,
      path   => "${bgi_path}${bgi_dat_file}",
      line   => "${fact}: ${fact_value}",
    }
  }
}
