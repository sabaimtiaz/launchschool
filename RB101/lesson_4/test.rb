produce = {apple: "fruit", banana: "fruit", carrot: "vegetable", radish: "vegetable"}

def select(produce_list)
  produce_keys = produce_list.keys
  produce_values = produce_list.values
  selected_fruit = {}

  counter = 0

  loop do
    break if counter == produce_keys.size 

    current_key = produce_keys[counter]
    current_value = produce_values[counter]

    if current_value == 'fruit'
      selected_fruit[current_key] = current_value
    end

    counter += 1
  end
  p selected_fruit
end


select(produce)