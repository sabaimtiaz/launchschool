module Drivable
  def drive # self.drive X Methods in mixin modules should be defined without using self. in the definition. If you add self. to the definition, the including class will only be able to access the method by calling Drivable.drive; furthermore, the method will not be available at all as an instance method to objects.
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive