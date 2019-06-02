# toggle switches
# the switches are first turned off
# in round one we switch on all the switches
# in round two, we change the switches that are multiples of 2
# in subsequent rounds, change the switches in multiples of 3, 4, 5....
# need to store the 'on/off' status
# data structure - use an array of 0s and switch them to 1s
# algorithm:
# initialise the data structure - array of 0s
# loop
# iterate through the 0s array and "switch" the 0s to 1s
# subsequent iterations: loop through this array and toggle 1s to 0s and 0s to 1s
# possible second method to just switch on/off
# returns the position of the "on" switches as an array which we know by doing index + 1
# need two iterators
# iterator 1 = index + 1
# iterator 2 = n repetitions

require 'pry'
def initialise_array(n)
  lights = []
  n.times do
    lights << 0
  end
  lights
end


def toggle(element)
  element == 0 ? 1 : 0
end

def lights(n)
  arr = initialise_array(n)
  n.times do |val|
    arr.map.with_index do |e, i|
      if (i + 1) % (val + 1) == 0
        arr[i] = toggle(e)
      end
    end
  end
  arr
end
p lights(5)

