module Transportation
	class Vehicle
	end

	class Truck < Vehicle
	end

	class Car < Vehicle
	end
end

truck = Transportation::Truck.new
puts truck