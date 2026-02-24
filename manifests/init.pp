# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include bginfo
class bginfo (
  Array[String] $displayed_facts
) {
  contain bginfo::file
  contain bginfo::package

  Class['bginfo::file']
  -> Class['bginfo::package']
}
