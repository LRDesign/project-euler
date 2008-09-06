require 'euler_solution.rb'

class Fixnum 
  N_BYTES = [42].pack('i').size 
  N_BITS = N_BYTES * 8 
  MAX = 2 ** (N_BITS - 2) - 1 
  MIN = -MAX - 1 
end 

class E014 < EulerSolution
  LIMIT = 1000000
      
  def step(num)
    if num % 2 == 0
      num / 2
    else
      (num * 3) + 1
    end
  end
  
  def chain_length(num)
    count = 1
    until num == 1
      #print "\t#num: #{num} count: #{count}"
      if (num > Fixnum::MAX) or @steps[num].nil?
        num = step(num)
        count += 1  
        #puts " added 1"    
      else
        count += @steps[num] - 1
        #puts " cached added #{@steps[num]}"        
        break
      end  
    end
    count
  end
  
  def answer
    @steps = Array.new
    longest = 0 
    max = 0
    for i in (1..LIMIT)
      #puts "Testing #{i}:"
      length  = chain_length(i)
      #puts "result #{i}: #{length}"
      @steps[i] = length
      #puts "wrote #{length} to steps[#{i}]"
      if length > max
        longest = i
        max = length
      end 
    end
    puts "longest: #{longest} max: #{max}"
    longest
  end
  
end