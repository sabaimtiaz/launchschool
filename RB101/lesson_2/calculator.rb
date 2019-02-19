#Build a command line calculator program that does the following:

    #asks for two numbers
  #  asks for the type of operation to perform: add, subtract, multiply or divide
  #  displays the result

#Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().

#asks the user for two numbers
#asks the user what kind of operation to perform
#performs the operation on the two numbers
#output the result

#answer = Kernel.gets()
#Kernel.puts(answer)

Kernel.puts("Welcome to Calculator")
Kernel.puts("What's the first number?")
num1 = Kernel.gets().chomp()
#Kernel.puts(num1.inspect)
#Kernel.puts("the number is " + num1 + "!")
Kernel.puts("What's the second number?")
num2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1' #adding '' since operator is a string
  result = num1.to_i() + num2.to_i()
elsif operator == '2'
  result = num1.to_i() - num2.to_i()
elsif operator == '3'
  result = num1.to_i() * num2.to_i()
elsif operator == '4'
 result = num1.to_f() / num2.to_f() #using float because of division
end

Kernel.puts("The result is #{result}")