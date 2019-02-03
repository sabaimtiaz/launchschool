words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live','fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide','flow', 'neon']
#iterate over the array
#sort each word into alphabetical order
#if the key exists we want to append the word into an array, or create a new key with the sorted word

#first step - initialise a result hash
result = {}

#iterate through the array using each
words.each do |word|
  key = word.split('').sort.join #split, join into new string
  if result.has_key?(key) #if result hash already has this key we can use this has_key method which returns a boolean and will pass in the key to assign key)
    result[key].push(word)
  else
    result[key] = [word] #assigning new key's value to be an array, placing the new word there
    end
  end

result.each_value do |v|
  puts "----"
  p v
end 
