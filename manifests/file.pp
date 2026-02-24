class bginfo::file {
  file { 'c:/BGInfo':
    ensure => directory,
  }
  file { 'C:/BGInfo/PuppetBGInfo.dat':
    ensure  => file,
    require => File['c:/BGInfo'],
  }
  file { 'C:/BGInfo/PuppetFacts.bgi':
    ensure  => file,
    source  => 'puppet:///modules/bginfo/PuppetFacts.bgi',
    require => File['c:/BGInfo'],
  }
}
