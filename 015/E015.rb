require 'euler_solution.rb'
class E015 < EulerSolution
  SIZE = 20
  
  def pascal_row(prev_row)
    row = Array.new
    for i in (1..(prev_row.size-1))
      row[i]=prev_row[i]+prev_row[i-1]
    end
    row[0]=1
    row[prev_row.size]=1
    row
  end
    
  
  def answer
    row = [1]
    (SIZE*2).times do
      row = pascal_row(row)
    end    
    row.max
  end
end