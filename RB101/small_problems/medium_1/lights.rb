# toggle switches from 1 - n
# round 1: every light is turned on
# first every light
# 2 = every second light
# every third

# starting / round one
lights = [0, 0, 0, 0, 0]
iterator = 0
iterator += 1
newarr = []
5.times do |light|  
  newarr << light += iterator
end

p newarr
# round two
