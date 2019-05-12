def fizzbuzz(num1, num2)
  result = []
  nums = (num1..num2).to_a
  nums.map do |num|
    if num % 3 == 0 && num % 5 == 0
      num = "FizzBuzz" 
      result << num
    elsif num % 3 == 0
      num = "Fizz"
      result << num
    elsif num % 5 == 0
      num = "Buzz"
      result << num
    else
      num
      result << num
    end
  end
  result
end
p fizzbuzz(1, 15)

# LS solution
def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case 
  when number % 3 == 0 && number % 5 == 0
   'FizzBuzz'
   when number % 3 == 0
   'Fizz'
   when number % 5 == 0
   'Buzz' 
  else
    number
  end
end
fizzbuzz(1, 15)