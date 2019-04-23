string = "Deleniti atque doloribus ipsam praesentium maiores eius eum. Dignissimos accusantium similique rerum necessitatibus ipsum. Aut magnam quos aperiam ut. Nisi et quia sed amet."
num = string.size / 10
if string.size > 80
  num.times do
    puts string.slice!(0..num) until string.size == 0
  end
end