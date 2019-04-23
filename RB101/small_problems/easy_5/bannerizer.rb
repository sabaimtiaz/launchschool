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


# LS solution
def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)} +"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box("To boldly go where no one has gone before.")
print_in_box(" ")


string = "Deleniti atque doloribus ipsam praesentium maiores eius eum. Dignissimos accusantium similique rerum necessitatibus ipsum. Aut magnam quos aperiam ut. Nisi et quia sed amet."
num = string.size / 10
if string.size > 80
  num.times do
    puts string.slice!(0..num) until string.size == 0
  end
end