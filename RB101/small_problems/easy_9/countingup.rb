def sequence(number)
  if number > 0
    (1..number).to_a
  # further exploration
  elsif number < 0
    (number..1).to_a
  end
end
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1)
