class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
	def initialize(year)
		super # invoke Vehicle#initialize --> passes all arguments to Vehicle#initialize
		start_engine 
	end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year