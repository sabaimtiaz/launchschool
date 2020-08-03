module Walkable
  def walk
   puts "#{name} #{gait} forward"
  end
end

class Animal
  include Walkable
end

class Person < Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

  private

  def gait
    "strolls"
  end

class Noble < Person
  attr_accessor :title

  def initialize(name, title)
    super(name)
    @title = title
    @name = title + " " + name
  end

  private
  def gait
    "struts"
  end
end

class Cat < Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk

mike = Person.new("Mike")
mike.walk

kitty = Cat.new("Kitty")
kitty.walk

flash = Cheetah.new("Flash")
flash.walk