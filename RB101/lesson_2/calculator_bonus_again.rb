LANGUAGE = 'en'
# LANGUAGE = 'nl'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i().to_s() == input
end

def number?(input)
  input == input.to_f().to_s()
end

def operation_to_message(op)
word = case op
       when '1'
         'Adding'
       when '2'
         'Subtracting'
       when '3'
         'Multiplying'
       when '4'
         'Dividing'
       end

puts word
end


def check_result?(result)
  result = result.to_s
 /^\d*\.?\d*$/.match(result)
end


def check_result?(result)
 /^\d*\.?\d*$/.match(result)
end

prompt('welcome')
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

puts "Hi #{name}!"

loop do # main loop
  num1 = '' # initialising the num1 variable outside the loop

  loop do
    prompt('input_one')
    num1 = Kernel.gets().chomp()
    if integer?(num1) || number?(num1)
      break
    else
      prompt('valid_number')
    end
  end

  num2 = '' # initialising the num2 variable outside the loop
  loop do
    prompt('input_two')
    num2 = Kernel.gets().chomp()
    if integer?(num2) || number?(num2)
      break
    else
      prompt('valid_number')
    end
  end

  prompt('operator_prompt')

  operator = '' # initialise operator variable outside the loop
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator) # if this array includes this operator
      break
    else
      prompt('choice')
    end
  end

  puts operation_to_message(operator)
  prompt('two_nums')

  result = case operator
           when '1'
             num1.to_i() + num2.to_i()
           when '2'
             num1.to_i() - num2.to_i()
           when '3'
             num1.to_i() * num2.to_i()
           when '4'
             num1.to_f() / num2.to_f() # using float because of division
           end

  prompt('result')
  puts result
  prompt('another')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  prompt('thanks')
end
