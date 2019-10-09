def print_longest_sentence(text)
  result = []
  sentences = text.split((/\.|\?|!/))
  sentences.map do |words|
    result << words
  end
  largest_sentence = result.max { |a, b| a.length <=> b.length }
  # puts "#{largest_sentence}"
  # puts "#{largest_sentence.split.size}"
end
print_longest_sentence("testing this sentence. and the! money!")
print_longest_sentence("Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.")

# redo with file.read

text = File.read('pg84.txt')
def print_largest_sentence(text)
  result = []
  sentences = text.split((/\.|\?|!/))
  sentences.map do |words|
    result << words
  end
  largest_sentence = result.max { |a, b| a.length <=> b.length }
  puts "#{largest_sentence}"
  puts "#{largest_sentence.split.size}"
end
print_largest_sentence(text)


# further exploration - longest word

text = File.read('pg84.txt')
def print_largest_sentence(text)
  result = []
  sentences = text.split(' ')
  sentences.map do |words|
    result << words
  end
  longest_word = result.max { |a, b| a.length <=> b.length }
  p longest_word
end
print_largest_sentence(text)

# further exploration - longest paragraph

def print_largest_paragraph(input)
  result = []
  paragraphs = input.split(/\n/)
  paragraphs.map do |sentences|
    result << sentences
  end
  longest_paragraph = result.max { |a, b| a.length <=> b.length }
end
print_largest_paragraph("We want to invite you to contribute your unique solution or analysis. The goal here is to showcase the variety of ways in which this exercise can be solved, and the various tradeoffs one has to consider when working to a solution. Please do not submit redundant solutions, or solutions you haven't tested, or solutions that contain errors. It's not mandatory that you submit a solution. If you do, make sure it's a somewhat good solution that may be useful to others who are learning.

Use the form below to add your solution or analysis for this exercise. You can include a link to a gist or pastebin, or write your entire solution right here. Make sure to use proper formatting so your code shows up correctly and preview your code first. You may include some commentary about your code and the tradeoffs you took, or some analysis about this exercise and its solutions. Make sure your solution fulfills all of the provided examples, if any, and doesn't contain any obvious errors.")

# longest word
def print_longest_word(input)
  words = input.split(' ')
  longest_word = words.max { |a, b| a.length <=> b.length }
  p longest_word
end
print_longest_word("We want to invite you to contribute your unique solution or analysis.")
print_longest_word("We want to invite you to contribute your unique solution or analysis. The goal here is to showcase the variety of ways in which this exercise can be solved, and the various tradeoffs one has to consider when working to a solution. Please do not submit redundant solutions, or solutions you haven't tested, or solutions that contain errors. It's not mandatory that you submit a solution. If you do, make sure it's a somewhat good solution that may be useful to others who are learning.
Use the form below to add your solution or analysis for this exercise. You can include a link to a gist or pastebin, or write your entire solution right here. Make sure to use proper formatting so your code shows up correctly and preview your code first. You may include some commentary about your code and the tradeoffs you took, or some analysis about this exercise and its solutions. Make sure your solution fulfills all of the provided examples, if any, and doesn't contain any obvious errors.")