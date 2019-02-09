say_hello = true
times = 0

while say_hello
  puts 'Hello!'
  times += 1
  say_hello = false if times == 5
end
