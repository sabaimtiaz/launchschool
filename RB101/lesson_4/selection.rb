alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do 
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char
  end

  counter += 1
  break if counter == alphabet.size
end

p selected_chars

fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do 
  current_element = fruits[counter]
  transformed_elements << current_element + 's'

  counter += 1
  break if counter == fruits.size
end
  
puts transformed_elements

def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do 
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

    puts selected_chars
end
select_vowels('the quick brown fox')
sentence = 'I wandered lonely as a cloud'
select_vowels(sentence)


puts "-------------------"


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(producelist)
 p producelist.select {|k, v| v == 'Fruit'}
end

select_fruit(produce)

puts "-------------"

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do 
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key] 

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end
 p selected_fruits
end

select_fruit(produce)
