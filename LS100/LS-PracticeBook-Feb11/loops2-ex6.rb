names = ['Sally', 'Joe', 'Lisa', 'Henry']
loop do
puts names.shift
#puts names.pop
break if names.empty?
end