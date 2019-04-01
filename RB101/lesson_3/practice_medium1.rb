#Q 1
# For this practice problem, write a one-line program that creates the following output 10 times, 
# with the subsequent line indented 1 space to the right:

string = "The Flintstones Rock!"
10.times { | number | puts (" " * number) + string }

#Q2

puts "the value of 40 + 2 is #{40+2}"

puts (40+2).to_s

# Q3
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
p factors
end
factors(3)
factors(0)
factors(42)

# Bonus 1

# What is the purpose of the number % divisor == 0 ?
# To ensure that the remainder is an integer

# Bonus 2

# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# to return factors

# Q4

# The buffer will be modified in the rolling_buffer1, becase we're adding the new element to the buffer 

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  p buffer
end
rolling_buffer1([5, 5], 5, 3)

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  p buffer
end
rolling_buffer2([5, 5], 5, 3)

# Q5


def fib(first_num, second_num)
 limit = 15

  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The limit was defined outside of the method. I decided to define it inside the method. 
# The other solution is to call it as an additional argument (outputs the same result == 13)

# Q6

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Q7
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# Q8
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
p mess_with_demographics(munsters)

# Q9
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#(innermost: rock -paper - paper, rock- scissors - rock, then paper v rock - paper) then outermost: rock v/s paper - paper)

# Q10
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)



