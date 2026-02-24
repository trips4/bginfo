class bginfo::file {
  file { 'C:/BGInfo/PuppetBGInfo.dat':
    ensure  => file,
  }
}
