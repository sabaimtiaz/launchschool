def fibonacci(nth)
  if nth == 1
    1
  elsif nth == 2
    2
  else
    fibonacci(nth-1) + fibonacci(nth-2)
  end
end
p fibonacci(5)

