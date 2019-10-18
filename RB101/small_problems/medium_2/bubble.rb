def bubble_sort!(array)
  counter = 0
  loop do
    i = 0
    loop do
      if (array[i] <=> array[i+1]) == 1
        array[i], array[i+1] = array[i+1], array[i]
      end
      i += 1
      break if i == array.size - 1
    end
    counter += 1
    break if counter == array.size
  end
  array
end
p bubble_sort!(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))
p bubble_sort!([1, 2, 4, 6, 7])
p bubble_sort!([6, 2, 7, 1, 4])
p bubble_sort!([5, 3])