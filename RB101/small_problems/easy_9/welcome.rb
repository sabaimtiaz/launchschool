def greetings(array, hash)
  "Hello #{array[0]} #{array[1]} #{array[2]}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
  # LS solution / further
  "Hello #{array.join(' ')}! Nice to have a "\
  "#{hash[:title]} #{hash[:occupation]} around."
end
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
