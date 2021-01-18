require 'minitest/autorun'
require_relative 'odd_words'

class OddWordTest < MiniTest::Test
	def test_reversing_odd_words
		sentence = OddWords.new("whats the matter with kansas.")
		assert_equal("whats eht matter htiw kansas.", sentence.reverse_odd_words)
	end

	def test_word_size_is_not_over_twenty
		sentence = OddWords.new("Why is it taking so long for everyojjdjdddlddddddddddjdjdjdjd sne to finish their work?")
		assert_raises TypeError do 
			sentence.reverse_odd_words
		end
	end

	def test_removes_extra_periods
		sentence = OddWords.new("whats the matter with kansas         ")
		assert_equal("whats eht matter htiw kansas.", sentence.reverse_odd_words)
	end

	def test_works_with_cases
		sentence = OddWords.new("Why is it taking so Long")
		assert_equal("Why si it gnikat so gnoL.", sentence.reverse_odd_words)
	end

	def test_one_word_sentences_are_returned
		sentence = OddWords.new("hello")
		assert_equal("hello", sentence.reverse_odd_words)
	end
end