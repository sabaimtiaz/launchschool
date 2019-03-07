words = %w(scooby doo on channel two)
# words.each {|str| puts str}
# words.each {|str| str << '!'}
words.each {|str| words.delete(str)}
puts words.inspect




