#!/usr/bin/ruby
$: << File.join(File.expand_path(File.dirname(__FILE__), "lib"))

require 'tools'
include Tools

def usage_message
  puts "Usage: euler.rb [number] [all]"
  exit
end

usage_message unless ARGV.size > 0

while (arg = ARGV.shift)
  if is_a_number?(arg)
    solve_one(arg.to_i)
  elsif arg == 'all'
    puts "Solve all not implemented yet"
  else
    usage_message
  end
end
