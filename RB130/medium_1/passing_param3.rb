items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)
# gather(items) do |*produce, wheat|
#   puts produce.join(', ')
#   puts wheat
# end

# 2)
# gather(items) do | apples, *produce, wheat |
#   puts apples
#   puts produce.join(', ')
#   puts wheat
# end

# 3)
# gather(items) do | apples, *produce |
#   puts apples
#   puts produce.join(', ')
# end

# 4)
# gather(items) do |apples, corn, cabbage, wheat|
# 	puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end