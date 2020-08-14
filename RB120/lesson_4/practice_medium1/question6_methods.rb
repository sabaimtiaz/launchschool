class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231" # using instance variables
  end

  def show_template
    template
  end
end

pc = Computer.new
pc.create_template
p pc.show_template

class Computer
  attr_accessor :template

  def create_template
   self.template = "template 14231" # calling self on the instance object
  end

  def show_template
   template
  end
end

pc = Computer.new
pc.create_template
p pc.show_template
