require 'euler_solution.rb'
class E021 < EulerSolution
  LIMIT = 10000
  
  def sum_of_divisors(n)
    (2..(n/2)).inject(1) {|sum, f| ((n % f).zero?) ? sum + f : sum }
  end
  
  def answer
    d = Array.new
    (1..LIMIT).each do |n|
      d[n] = sum_of_divisors(n)
      # puts "#{n}: #{d[n]}"
    end    
    sum = 0
    (1..d.size).each do |n|
       if (!d[n].nil?) && (!d[d[n]].nil?) && d[d[n]] == n && d[n] != n
         sum += n
         puts "amicable pair: #{n} #{d[n]}"
       else
         sum
       end
     end
     sum
  end
  
end