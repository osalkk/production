define replace_matching_line($file,$match,$replace) {
    exec { "/usr/bin/ruby -i -p -e 'sub(%r{$match}, \"$replace\")' ${file}":
    onlyif => "/bin/grep -E '${match}' ${file}",
    }
  }

replace_matching_line { 'rootlogger':
    file => '/opt/solr/core/log4j.properties',
    match => '^=INFO',
    replace => '=WARN',
  }

