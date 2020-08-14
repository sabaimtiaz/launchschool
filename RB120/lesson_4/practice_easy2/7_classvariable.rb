class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

p Cat.cats_count # 0
harry = Cat.new("Persian")
georgina = Cat.new("Lynx")
timmy = Cat.new("Siamese")
p Cat.cats_count # 3


# the cats_count class variable keeps count of the number of instances of the Cat class that have been created.

