module Tools
  
  # test if a string is a number
  def is_a_number?(s)   
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true    
  end

  def elapse
    start = Time.now
    [yield, Time.now-start]
  end
  
  def solve_puzzle(solution)
    (ans, elapsed) = elapse { solution.answer }
    "#{solution.class} solution: #{ans} computed in: #{elapsed} sec"
  end
  
  def solve_one(arg)
    require "#{arg}/E#{arg}"
    solution_class = Object.const_get("E#{arg}")
    solution = solution_class.new 
    puts solve_puzzle(solution)
  end
  
end  