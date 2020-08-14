class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
oracle = Oracle.new
p oracle.predict_the_future # returns a string with one of the choices from the array defined in the array returned by the choices method