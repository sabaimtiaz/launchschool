def fibonacci_last(nth)
  first, last = [1,1]
  3.upto(nth) do 
    first, last = [last, first + last]
  end
  p last.digits.reverse[-1]
end
fibonacci_last(20)
fibonacci_last(15)       
fibonacci_last(20)      
fibonacci_last(100)       

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  p last_2.last
end

fibonacci_last(100_001)   
fibonacci_last(1_000_007) 
fibonacci_last(123456789)

