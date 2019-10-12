# data
# right - one angle == 90 
# acute all three angle < 90
# obtuse one sngle > 90
# valid - sum of angles == 180
# angles be greater than zero
# return symbol


def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  degree = 90
  case
    when angles.include?(0) || angles.sum < 180
    :invalid
  when angles.all? { |angle| angle < degree } 
    :acute
  when angles.include?(degree) 
    :right
  when angles.max > degree
    :obtuse
  end
end
p triangle(60, 70, 50) #== :acute
p triangle(30, 90, 60) #== :right
p triangle(120, 50, 10) #== :obtuse
p triangle(0, 90, 90) #== :invalid
p triangle(50, 50, 50) #== :invalid