LIMIT = 4000000
a = 1
b = 1
sum = 0
fib = a + b
while (fib = a + b ) < LIMIT
  sum += fib if (fib%2)==0
  a = b
  b = fib  
end 
  
puts sum