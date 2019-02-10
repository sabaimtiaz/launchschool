colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do 
break if i == things.length 

if i == 0
  puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
else
  puts 'And a ' + colors[i] + ' ' + things[i] + '.'
end

i += 1
end