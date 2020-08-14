class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  #def self.light_status
  def self.status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end