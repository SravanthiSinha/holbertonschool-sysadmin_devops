#!/usr/bin/ruby
ARGV[0].split("").each do |i|
  print i.match(/[A-Z!]/)
end
print "\n"
