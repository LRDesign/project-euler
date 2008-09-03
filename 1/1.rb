total = 0
(1...1000).to_a.each do |n|
  total += n if (n/3).integer? or (n/5).integer?
end
puts total
