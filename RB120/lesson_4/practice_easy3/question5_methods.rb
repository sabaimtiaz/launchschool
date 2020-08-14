class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
p tv.manufacturer # NoMethodError, because its a class method not an instance method
p tv.model
p Television.manufacturer 
p Television.model # error, because this is an instance method, not a class method
