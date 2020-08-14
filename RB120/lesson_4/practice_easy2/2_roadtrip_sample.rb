class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future # returns a string with a string from the array returned by the choices method defined in the RoadTrip class
# method lookup --> it'll first look for choices in RoadTrip, then if it didn't find it, in Oracle
