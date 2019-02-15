count = 1
loop do
  if count.even?
    puts "#{count} is even!"
  end

  if count.odd?
    puts "#{count} is odd!"
  end
  
  count += 1 
  break if count > 5
end