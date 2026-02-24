class bginfo::file {
  $bginfo_dir = 'c:/BGInfo'
  $bginfo_bgi = "${bginfo_dir}/PuppetFacts.bgi"
  $bginfo_dat = "${bginfo_dir}/PuppetBGInfo.dat"

  file { $bginfo_dir:
    ensure => directory,
  }
  file { $bginfo_dat:
    ensure  => file,
    require => File[$bginfo_dir],
  }
  file { $bginfo_bgi:
    ensure  => file,
    source  => 'puppet:///modules/bginfo/PuppetFacts.bgi',
    require => File[$bginfo_dir],
  }
  file_line { 'BGInfo Task':
    ensure => present,
    path   => $bginfo_dat,
    line   => "OS Family: ${facts['os']['family']}",
  }
}
