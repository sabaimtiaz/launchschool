class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
  	greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#Hello.new.hi #unidentified method, it's not a class method so cannot be called on the Hello class 