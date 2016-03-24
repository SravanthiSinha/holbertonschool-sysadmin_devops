#!/usr/bin/ruby
/\[from:(?<from>[a-zA-Z0-9\+]+)\].*\[to:(?<to>[a-zA-Z0-9\+]+)\].*\[flags:(?<flags>[01\-:]+)\]/ =~ ARGV[0]
puts [from, to, flags].join(',')
