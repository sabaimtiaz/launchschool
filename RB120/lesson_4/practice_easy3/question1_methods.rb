class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # Hello

hello = Hello.new
hello.bye # error since bye isnt a method of the Greeting class that's available to Hello

hello = Hello.new
hello.greet # Hello $returns an error since there's no argument passed to it

hello = Hello.new
hello.greet("Goodbye") # Goodbye

Hello.hi #unidentified method, it's not a class method so cannot be called on the Hello class 