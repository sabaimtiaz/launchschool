
def cleanup(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  other_chars = %w[! " £ $ % ^ & * ) ) @  \ # [ ]- _ + / | - ' ?]
  spaces = (' ')
  new_arr = string.chars
  new_arr.map do |char| 
    if other_chars.include?(char) 
      char.replace(' ')
    end
    new_arr.join('').squeeze(' ')
  end
end
cleanup("---what's my +*& line?")
