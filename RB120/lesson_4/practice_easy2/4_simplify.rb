class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end