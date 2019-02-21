def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end

def make(new_car)
  new_car.split(" ")[0]
end

def model(new_car)
  new_car.split(" ")[1]
end

make, model = car("Ford Mustang")
make == "Ford"

# I like to see that the code has worked
puts model.start_with?("M")

puts "The make of the car is #{make}"
puts "The model of the car is #{model}"

