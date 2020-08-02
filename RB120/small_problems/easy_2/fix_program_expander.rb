class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3) # cannot call private methods with self
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander