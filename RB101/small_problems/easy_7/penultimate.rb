def penultimate(string)
  string.split(' ').slice(-2)
end
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

# further exploration
def penultimate(string)
  num = string.split(' ').size/2
  result = string.split(' ').slice(num)
  if result == nil
    puts "The string is empty"
  elsif
    string.size == 1
    p string
  end
  result
end
penultimate("the coffee is delicious because it is") == "delicious"
penultimate('Launch School is great!') == 'is'
penultimate("") == nil
p penultimate("launch")