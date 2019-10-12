# define a triangle based on the data provided
# data
# equ - all 3 sides are equal
# isco - 2 sides equal, 3rd side different
# scalene = 3 sides different
# valid - sum of 2 shorter sides > length of longer side
# sides must be greater than zero
# return symbol

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max
  sides_sum = sides.reduce(:+)
  shortest_sides = sides.sort[0..1]
  case
    when sides.include?(0) || shortest_sides.sum < largest_side
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :iscosceles
  when 
    side1 != side2 && side2 != side3 && side1 != side3
    :scalene
  end
end
p triangle(3, 3, 3) # == :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5)# == :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1)# == :invalid