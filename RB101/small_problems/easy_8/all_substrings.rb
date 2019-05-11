  def substrings_at_start(string)
  substrings = []
  num = 0
  string.size.times do
    substrings << string[0..num]
    num += 1
  end
  substrings
end

def all_substrings(string)
  substrings = []
  string.size.times do |i|
    substrings << substrings_at_start(string[i..-1])
  end
  substrings.flatten
end
p all_substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# LS solution
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
