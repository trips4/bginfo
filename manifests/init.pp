# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include bginfo
class bginfo {
  contain bginfo::file
  contain bginfo::package

  Class['bginfo::file']
  -> Class['bginfo::package']
}
