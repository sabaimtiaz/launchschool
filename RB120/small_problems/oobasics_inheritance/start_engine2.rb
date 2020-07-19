class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
  	super() + " Drive #{speed}, please!" # call super with empty parantheses since start_engine in Vehicle doesn't accept arguments
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
