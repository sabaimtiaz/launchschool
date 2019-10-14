def featured(number)
  range = (1..9_876_543_210)
  range.each do |value| 
     if (value % 7 == 0) && value.odd? && (value.digits == value.digits.uniq) && value > number
      p value
      break
    end
  end
  return "There is no value that fulfills these requirements."
end
featured(12) 
featured(20) 
featured(21) 
featured(997) 
featured(1029) 
featured(999_999) 
featured(999_999_987) 
featured(9_999_999_999) 

# LS solution
def featured(number)
  number +=1
  number +=1 until number.odd?

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end
  'There is no possible number that fulfills those requirements'
end
featured(12) 
featured(20) 
featured(21) 
featured(997) 
featured(1029) 
featured(999_999) 
featured(999_999_987) 
featured(9_999_999_999) 