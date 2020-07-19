class Person

  def initialize(name)
    @name = name
  end

  def name # new getter method
  	@name.clone
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name