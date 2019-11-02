# eight pointed star
# n x n grid - n rows, n columns
# in the first row, the stars need to be equally spaced out 

def star(n)
  space = ' '
  iterator_1 = n/2
  iterator_2 = 1

  loop do
    iterator_1 -= 1
    iterator_2 += 1
    puts (space * iterator_2) + ("*" + space * iterator_1) * 3
    break if iterator_1 == 0
  end
  puts space * 2 + "*" * n

  loop do 
    puts (space * iterator_2) + ("*" + space * iterator_1) * 3
    iterator_1 += 1
    iterator_2 -= 1
    break if iterator_1 == n/2
  end
end
star(19)