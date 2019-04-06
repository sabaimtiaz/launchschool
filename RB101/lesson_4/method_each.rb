[1, 2, 3].each do |num|
  puts num
end

hash = { a: 1, b: 2, c: 3}
hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end

def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  #puts 'hi'
end
puts a_method

[1, 2, 3].select do |num|
 num.odd?
end

[1, 2, 3].select do |num|
 puts num + 1
end

[1, 2, 3].map do |num|
  puts num*2
end

[1, 2, 3].map do |num|
  puts num.odd?
end

[1, 2, 3].map do |num|
  p 'hi'
end