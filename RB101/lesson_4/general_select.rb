def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do 
    break if counter == produce_keys.size
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    if current_value == selection_criteria
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
p general_select(produce, 'Fruit')
p general_select(produce, 'Vegetable')
p general_select(produce, 'Meat')
