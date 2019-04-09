words = "the flintstones rock"
p words.split
transformed_words = words.split.map {|word| word.capitalize!}.join(' ')
p transformed_words
