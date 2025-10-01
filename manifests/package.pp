# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include bginfo::package
class bginfo::package {
  file { 'BGInfo64.exe':
    ensure => 'file',
    path   => 'C:/Windows/BGInfo64.exe',
    source => 'puppet:///modules/bginfo/files/BGInfo64.exe',
  }
}
