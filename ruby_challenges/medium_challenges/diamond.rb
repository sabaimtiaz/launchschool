class Diamond
  def self.make_diamond(alpha)
    return "A\n" if alpha == "A"
    @alphabets = ('A'..alpha).to_a
    @reverse_alpha = @alphabets.reverse
    result = []
    counter = 1

    @alphabets.each.with_index do |letter, idx|
      if letter == "A"
        result << row_generator(letter) + spaces(letter)
      elsif letter == "B"
       result << row_generator(letter) + (" " * idx) + row_generator(letter).reverse
      else
        result << row_generator(letter) + (" " * (idx + counter)) + row_generator(letter).reverse 
        counter += 1
      end
    end  
    result.join("\n") + "\n" + result.reverse[1..-1].join("\n") + "\n"
  end  

  private
  def self.row_generator(letter)
    spaces(letter) + letter
  end

  def self.spaces(letter)
    space = " "
    (space * @reverse_alpha.index(letter))
  end
end 
