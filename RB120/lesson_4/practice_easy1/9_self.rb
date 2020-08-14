class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count # self here represents the class Cat, it is a Class method
    @@cats_count
  end
end