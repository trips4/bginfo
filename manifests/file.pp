class bginfo::file {

  $bgi_cfg_file = 'PuppetFacts.bgi'
  $bgi_dat_file = 'PuppetBGInfo.dat'
  $bgi_dir      = 'BGInfo'
  $bgi_path     = 'c:/'

  # Ensure the BGInfo directory exists.
  file { "${bgi_path}${bgi_dir}":
    ensure => directory,
  }
  # Ensure the .dat and .bgi files exist, with the .bgi file sourced from the module.
  file { "${bgi_path}${bgi_dir}/${bgi_dat_file}":
    ensure  => file,
    require => File["${bgi_path}${bgi_dir}"],
  }
  file { "${bgi_path}${bgi_dir}/${bgi_cfg_file}":
    ensure  => file,
    source  => 'puppet:///modules/bginfo/PuppetFacts.bgi',
    require => File["${bgi_path}${bgi_dir}"],
  }
  # Populate the .dat file with the specified facts and their values.
  $bginfo::displayed_facts.each |String $fact| {
    $fact_parts = $fact.split('[.]')
    $fact_value = dig($facts, *$fact_parts)

    file_line { "BGInfo Task ${fact_parts}":
      ensure => present,
      path   => "${bgi_path}${bgi_dir}/${bgi_dat_file}",
      line   => "${fact}: ${fact_value}",
    }
  }
}
