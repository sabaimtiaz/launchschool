def triangle(num)
  number = num + 1
  iterator_1 = number
  iterator_2 = 0
  space = ' '
  number.times do  
    puts space * iterator_1 + "*" * iterator_2
    iterator_1 -= 1
    iterator_2 += 1
    break if iterator_2 > number
  end
end
triangle(5)
triangle(9)