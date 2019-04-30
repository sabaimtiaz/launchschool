# generate fibonacci number


def find_fibonacci_index_by_length(length)
first = 1
second = 1
fibonacci = ''
index = 2

  loop do

    index += 1
    fibonacci = first + second
    first = second
    second = fibonacci
    if fibonacci.digits.size == length
     p index
      break
    end
  end
end
find_fibonacci_index_by_length(2)
find_fibonacci_index_by_length(3)
find_fibonacci_index_by_length(10)
find_fibonacci_index_by_length(100)
find_fibonacci_index_by_length(1000)
#find_fibonacci_index_by_length(10000)