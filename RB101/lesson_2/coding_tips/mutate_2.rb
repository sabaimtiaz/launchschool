# variable shadowing

name = 'johnson'
['kim', 'joe', 'sam'].each do |name|
#  name = fname

#  puts "#{name} #{name}"
end

names = ['kim', 'joe', 'sam']
names.each { |_| puts "got a name!"}

names.each_with_index do|_, idx|
  puts "#{idx+1}.got a name!"
end