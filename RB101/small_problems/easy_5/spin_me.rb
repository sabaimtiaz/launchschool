def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end
str = "hello world"
puts spin_me(str).object_id # "olleh dlrow"
puts str.object_id
