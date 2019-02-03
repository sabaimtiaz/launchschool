def has_a_b?(string)
  if /b/.match(string)
    puts "We have a match!"
  else
    puts "There is no match."
  end
end

has_a_b?("basketball")
has_a_b?("baseball")
has_a_b?("hockey")
has_a_b?("golf")