#!/usr/bin/ruby
ARGV[0].split("").each do |i|
  print i.match(/[a-zA-Z0-9]/)
end
print "\n"
