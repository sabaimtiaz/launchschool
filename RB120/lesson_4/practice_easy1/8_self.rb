class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1 # self refers to the instance calling the method
  end
end

cat = Cat.new("Persian")
p cat.age
cat.make_one_year_older
p cat.age