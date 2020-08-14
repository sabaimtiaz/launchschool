class KrispyKreme
	attr_reader :filling_type, :glazing
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  # def to_s
  # 	if filling_type.nil? && !glazing.nil?
  # 		"Plain with #{glazing}"
  # 	elsif glazing.nil? && !filling_type.nil?
  # 		"#{filling_type}"
  # 	elsif filling_type.nil? && glazing.nil?
  # 		"Plain"
  # 	else
  # 		"#{filling_type} with #{glazing}"
  # 	end
#  end

  def to_s
  	filling_string = filling_type ? filling_type : "Plain"
  	glazing_string = glazing ? " with #{glazing}" : ''
  	filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")
puts donut1
puts donut2
puts donut3
puts donut4
puts donut5
