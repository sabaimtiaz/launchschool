# problem
# have a bank of switches - all off
# round 1 - switch all lights on
# subsequent rounds- switch lights off on increasing multiples of 2, 3, 4, 5..
# subsequent rounds = n repetitions
#  return result as array of lights that are on
# data structure
# array
# algorithm
# initialize lights
# sinitialize n and first round of lights being switched on - array index from off to on
# use modulo operator to check if keys are divisible by increasing multiples
# return keys
#lights = {"1"=>"off", "2"=>"off", "3"=>"off", "4"=>"off", "5"=>"off"}
#n = 1
#lights.map do |_, values|
#  if n == 1
 #   values = "on"
  #end
  #lights
#end


# initialise array
def initialise_array(n)
  lights = []
  n.times do 
    lights << 0
  end
  lights
end

# toggle lights
def toggle_status(element)
  element == 0 ? 1 : 0
end

def lights(n)
  lights_on = []
  arr = initialise_array(n)
  n.times do |val|
    arr.map.with_index do |element, ind|
      if (ind+1) % (val+1) == 0
       arr[ind] = toggle_status(element)
      end
    end
  end
  arr.each.with_index do |element, ind|
    if element == 1
      lights_on << (ind + 1)
    end
  end
  lights_on
end
p lights(5)
