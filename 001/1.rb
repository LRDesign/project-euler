def divisible?(x,y)
  x%y == 0
end

total = 0
(1...1000).to_a.each do |n|
  if divisible?(n,3) or divisible?(n,5)
    #puts n
    total += n 
  end
end
puts total

