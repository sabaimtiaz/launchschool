class OddWords
	attr_accessor :sentence

	def initialize(sentence)
		@sentence = sentence
	end

	def reverse_odd_words
		return sentence if sentence.split.size <= 1
		sentence.split(/[^a-zA-Z]/).map!.with_index do |word, idx|
			raise TypeError if word.size > 20
			idx.odd? ? word.reverse! : word
		end.join(' ') + "."
	end

	# bonus
	def print_reversed_words
		sentence.split(/[^a-zA-Z]/).each.with_index do |word, idx|
			if idx.odd?
				word.reverse!.split('').each.with_index do |char, idx|
					p char
				end
				p word
			else
				word.split('').each { |char| p char}
				p word
			end
		end
		reverse_odd_words
	end
end
sent = OddWords.new("")
p sent.reverse_odd_words