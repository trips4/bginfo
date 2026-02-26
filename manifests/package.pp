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
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Help':
    ensure => present,
    type   => string,
    data   => 'testme',
  }
  # registry_value {'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\SDL\Passolo 2018\License\CheckedOutEdition':
  #   ensure => present,
  #   type   => string,
  #   data   => 'ProfessionalEditionPas',
  # }
}
