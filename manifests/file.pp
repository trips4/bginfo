class bginfo::file {

  $bgi_cfg_file = 'PuppetFacts.bgi'
  $bgi_dat_file = 'PuppetBGInfo.dat'
  $bgi_dir      = 'BGInfo'
  $bgi_path     = 'c:/'

  # Ensure the BGInfo directory exists.
  file { "${bgi_path}${bgi_dir}":
    ensure => directory,
  }

  file { "${bgi_path}${bgi_dir}/${bgi_cfg_file}":
    ensure  => file,
    source  => 'puppet:///modules/bginfo/PuppetFacts.bgi',
    require => File["${bgi_path}${bgi_dir}"],
  }

  file { "${bgi_path}${bgi_dir}/${bgi_dat_file}":
    ensure  => file,
    content => epp('bginfo/bginfo.epp'),
    require => File["${bgi_path}${bgi_dir}"],
  }
}
