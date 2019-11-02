require 'pry'
def diamond(n)
  iterator_1 = n
  iterator_star = 1
  space = ' '
  n.times do
    break if iterator_star >= n
    puts (space * iterator_1) + ("*" * iterator_star)
    iterator_1 -= 1
    iterator_star += 2
   end
  n.times do
    puts (space * iterator_1) + ("*" * n)
    iterator_1 += 1
    n -= 2
    break if n < 1
  end
end
p diamond(3)

# LS solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance)}
  1.upto(max_distance)   { |distance| print_row(grid_size, distance)}
end
# diamond(3)

# ls user solutiion
def diamond(n)
  star = "*"
  top = n/2
  bottom = n/2 + 1
  top.times do
    puts star.center(n)
    star += "**"
  end
  bottom.times do |i|
    star = '*' * (n - i * 2)
    puts star.center(n)
  end
end

puts "----------- "

#reworked
def diamond(n)
  iterator_star = 1
  center_val = n
  # top half
  n.times do
    break if iterator_star >= n
    puts ("*" * iterator_star).center(center_val)
    iterator_star += 2
   end
  # bottom half
  n.times do
    break if n < 1
    puts ("*" * n).center(center_val)
    n -= 2
  end
end
diamond(5)

puts "-----------"

# further exploration

def diamond(n)
  iterator_star = 1
  center_val = n
  star = "*"
  space = " "
  # top half
  n.times do
    break if iterator_star >= (n/2)
    puts star.center(center_val) if iterator_star == 1
    puts (star + (space * iterator_star) + star).center(center_val) 
    iterator_star += 2
   end
  # bottom half
  n.times do
    break if n/2 < 1 || iterator_star < 1
    puts (star + (space * iterator_star) + star).center(center_val)
    n -= 2
    puts star.center(center_val) if iterator_star <= 1
    iterator_star -= 2
  end
end
diamond(5)
