  def substrings_at_start(string)
  substrings = []
  num = 0
  string.size.times do
    substrings << string[0..num]
    num += 1
  end
  substrings
end

def palindromes(string)
  substrings = []
  palindromes = []
  string.size.times do |i|
    substrings << substrings_at_start(string[i..-1])
  end
  for word in substrings.flatten
    if word.reverse == word && word.length > 1 && word =~ /['a-z']/
      palindromes << word
    end
  end
  palindromes
end
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('!!') == []
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]