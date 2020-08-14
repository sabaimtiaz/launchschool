module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
	include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
	include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new
car.go_fast
truck = Truck.new
truck.go_fast

# It prints the name of the type of the vehicle because we're calling self.class 
# self refers to the object (Car/Truck)
# ask self to tell us its class with .class
# don't need to use to_s because its inside a string and that takes care of the need to use to_s
