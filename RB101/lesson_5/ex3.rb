[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Line 
# 1 
# Action
# calling the map method by passing through a block
# Object
# the outer multi-dimensional array
# Side Effect
# none
# Return value
# [1, 3]
# Is Return Value Used
# no, shown on line 3

# line
# 2
# Action
# assigning the first index value to the locla variable array and using puts to show it
# side effect
# none
# is return value used
# yes, to show map

# line 3
# action
# returning arr.first  - the 0 index value
# yes, return value used 
# object array


