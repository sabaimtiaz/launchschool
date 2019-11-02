
NOUNS = ["cat", "cow", "dog", "person", "cup", "tea", "chicken", "animal"]
VERBS = ["eating", "sleeping", "reading", "giving", "jumping", "playing"]
ADJECTIVES = ["beautiful", "lazy", "hungry", "sleepy", "nervous", "confident"]
ADVERBS = ["lazily", "sleepily", "speedily", "defiantly", "hungrily"]

text = File.read('madlibs.txt')
def replace_text(text)
  text = text.split
  text.map do |line|
      line.gsub!("<adjective>", ADJECTIVES.sample)
      line.gsub!("<noun>", NOUNS.sample)
      line.gsub!("<adverb>", ADVERBS.sample)
      line.gsub!("<verb>", VERBS.sample)
    end
    result = ' '
    for word in text
      result << word + " "
    end
   result.strip
  end
p replace_text(text)

# text = File.read('nonsense.txt')
# def madlibs(text)
#   split_sentence = text.split(' ')
#   split_sentence.map do |word| 
#     case
#     when /the/.match(word)
#       word.concat(" " + ADJECTIVES.sample)
#       word << " " + NOUNS.sample
#     when /ing/.match(word)
#       word.replace(VERBS.sample)
#       word.prepend(ADVERBS.sample + " ")
#     end
#   end
#   result = ''
#   for word in split_sentence
#     result << word + " "
#   end
#   result.strip
# end
# madlibs(text)
