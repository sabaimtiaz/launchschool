class Cat
	attr_reader :type
  def initialize(type)
    @type = type
  end

  def to_s
  	"I am a #{type}"
  end
end
cat = Cat.new("tabby")
puts cat