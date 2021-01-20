class PigLatin
	attr_accessor :word, :phrase

	def self.translate(phrase)
		phrase.split(' ').map do |word|
			translate_one_word(word)
		end.join(' ')
	end

	def self.translate_one_word(word)
		if starts_with_alphabet?(word) || starts_with_xr_yt?(word)
			return word + "ay"
		elsif starts_with_squ_sch_thr?(word)
			return word << word.slice!(0..2) << "ay"
		elsif starts_with_th_qu_ch?(word)
			return word << word.slice!(0..1) << "ay"
		elsif starts_with_consonant?(word)
			return word << word.slice!(0) << "ay"
		end
	end

	def self.starts_with_alphabet?(word)
		word[0] =~ /[aeiou]/
	end

	def self.starts_with_consonant?(word)
		word[0] =~ /[^aeiou]/
	end

	def self.starts_with_xr_yt?(word)
		word[0..1] == "xr" || word[0..1] == "yt"
	end

	def self.starts_with_th_qu_ch?(word)
		combos = %w(th qu ch)
		combos.any? { |combo| word[0..1] == combo }
	end

	def self.starts_with_squ_sch_thr?(word)
		combos = %w(squ sch thr)
		combos.any? { |combo| word[0..2] == combo }
	end
end
