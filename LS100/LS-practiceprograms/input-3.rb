puts "Type a sentence:"
sentence = gets.chomp.to_s.reverse

puts "Type a number:"
num = gets.chomp.to_i

num.times do 
  puts sentence 
end
