require "#{ARGV[0]}/E#{ARGV[0]}"
solution_class = Object.const_get("E#{ARGV[0]}")
@solution = solution_class.new
puts ("Solution: #{@solution.answer}")