# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include bginfo::package
class bginfo::package {
  file { 'C:/BGInfo/BGInfo64.exe':
    ensure => file,
    source => 'puppet:///modules/bginfo/BGInfo64.exe',
  }
  registry_value { 'BGInfo':
    ensure => present,
    path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',
    type   => string,
    data   => 'testme',
  }
}
