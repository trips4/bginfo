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
  registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\Run':
    ensure => present,
    type   => string,
    data   => 'c:\BGInfo\Bginfo.exe c:\BGInfo\PuppetFacts.bgi /timer:0 /silent /nolicprompt',
  }
}
