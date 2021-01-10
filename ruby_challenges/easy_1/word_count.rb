class Phrase
	attr_accessor :string

	def initialize(string)
		@string = string
	end

	def word_count
		given_str = string.downcase.scan(/\b[\w']+\b/)
		word_counts = Hash.new(0)
		given_str.uniq.each do |word|
			word_counts[word] = given_str.count(word)
		end
		word_counts
	end
end
