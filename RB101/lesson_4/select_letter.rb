def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do 
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end
question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a').size
