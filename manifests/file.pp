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
    notify { "The Fact to Process = ${fact}":
    }
    #$fact_parts = split($fact, '[.]') Works
    $fact_parts = $fact.split('[.]')
    notify { "Var fact_parts = ${fact_parts}": }
    # $fact_path  = $fact_parts.map |$part| { "['${part}']" }.join('.')
    # notify { "Fact path for ${fact}: ${fact_path}":
    # }
    # $fact_value = $facts.dig(*$fact_parts)
    # notify { "Fact value for ${fact}: ${fact_value}":
    # }

    # file_line { "BGInfo Task ${fact}":
    #   ensure => present,
    #   path   => $bginfo_dat,
    #   line   => "${fact_path}: ${fact_value}",
    # }
  }
}
