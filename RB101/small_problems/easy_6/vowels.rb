#string = "coffee"
#chars = /[aeiou]/.match(string)
#string.delete!(chars.to_s)



def remove_vowels(arr)
  arr.map { |word| word.gsub(/[aeiuoAEIOU]/, "") }
end
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

def remove_vowels(arr)
  arr.map { |word| word.delete('aeiuoAEIOU') }
end
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
