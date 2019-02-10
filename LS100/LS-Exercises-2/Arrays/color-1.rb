colors = ['red', 'yellow', 'green', 'blue']
colors.each do |color| #call the each method on the collection and pass a block to the method invocation using do/end
  puts "I am the color #{color}"
end