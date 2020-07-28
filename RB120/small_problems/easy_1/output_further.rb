class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s 
  end

  def to_s
    @name = name.upcase # the upcase method is being called on a string 
    "My name is #{@name}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
# the name variable is not reassigned to 43 [as it is incremented on line 16] 
# because the string object referenced by name exists outside of the Fluffy object
