puts 'What is your age?'
age = gets.chomp.to_i
puts 'At what age would you like to retire?'
ret_age = gets.chomp.to_i
t = Time.now
year = t.year.to_i
yrs_togo = ret_age - age
ret_year = year + yrs_togo
puts "It's #{year}. You will retire in #{ret_year}."
puts "You only have #{yrs_togo} years of work to go!"