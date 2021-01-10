class Anagram
	attr_accessor :string

	def initialize(string)
		@string = string
	end

	def sorted_words
		string.downcase.chars.sort
	end

	def match(arr)
		arr.select do |word|
			(word.downcase.chars.sort == sorted_words) && (word.downcase != string.downcase)
		end
	end
end
