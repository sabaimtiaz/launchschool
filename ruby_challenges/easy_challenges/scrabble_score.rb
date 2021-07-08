class Scrabble
	@@points = {}

	%w(a e i o u l n r s t).each { |k | @@points[k] = 1 } 
	%w(d g).each { |k | @@points[k] = 2 }
	%w(b c m p).each { |k| @@points[k] = 3 }
	%w(f h v m y).each { |k| @@points[k] = 4 }
	@@points.store("k", 5)
	%w(j x).each { |elem|	@@points[elem] = 8 }
	%w(q z).each { |elem| @@points[elem] = 10 }

	def initialize(word)
		@word = word
	end

	def score
		return 0 if @word.nil? || @word.empty? || @word.scan(/[^a-zA-Z]/).count != 0
		total = []
		word = @word.downcase
		word.chars.uniq.each do |elem|
			total << (@@points.fetch(elem) * word.count(elem))
		end
		total.sum
	end

	def self.score(phrase)
		Scrabble.new(phrase).score
	end
end