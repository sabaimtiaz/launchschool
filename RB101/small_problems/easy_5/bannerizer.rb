# test code
# string = "coffee"
# num = string.size + 2
# 1.times do 
  # puts "-"*num
  # puts "|"*1 + string + "|"*1
  # puts "-"*num
# end

def print_in_box(string)
  if string.size > 76
    string = string.slice(0..75) + "...TRUNCATED"
  end

  num = string.size 
  1.times do 
    puts "+" + "-" * num + "+"
    puts "|" * 1 + string + "|" * 1
    puts "+" + "-" * num + "+"
  end
end
print_in_box("To boldly go where no one has gone before.")
print_in_box(" ")
print_in_box("Deleniti atque doloribus ipsam praesentium maiores eius eum. Dignissimos accusantium similique rerum necessitatibus ipsum. Aut magnam quos aperiam ut. Nisi et quia sed amet.")