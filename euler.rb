#!/usr/bin/ruby
$: << File.join(File.expand_path(File.dirname(__FILE__), "lib"))

require 'tools'
include Tools

while (arg = ARGV.shift)
  if is_a_number?(arg)
    solve_one(arg.to_i)
  elsif arg == 'all'
    puts "Solve all not implemented yet"
  else
    puts "Usage: euler.rb [number] [all]"
  end
end
