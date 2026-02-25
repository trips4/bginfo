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

  $bginfo::displayed_facts.each |String $fact| {
    $fact_parts = $fact.split('[.]')
    $fact_value = dig($facts, *$fact_parts)


    file_line { "BGInfo Task ${fact_parts}":
      ensure => present,
      path   => $bginfo_dat,
      line   => "${fact_parts}: ${fact_value}",
    }
  }
}
