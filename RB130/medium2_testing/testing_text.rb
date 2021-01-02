require 'minitest/autorun'
require_relative 'text'

class TestingText < MiniTest::Test
	def setup
		@file = File.open('sampletext.txt')
		@text_to_read = @file.read
		@text = Text.new(@text_to_read)
	end

	def test_swap_method
		swapped_text = @text.swap("a", "e")
		num_of_a = @text_to_read.split.count("a")
		num_of_e = swapped_text.split.count("e")
		assert_equal(num_of_e, num_of_a)
		#assert(!swapped_text.include?("a"))
	end

	def test_word_count
		assert_equal(@text.word_count, 72)
	end

	def teardown
		@file.close
		puts "File has been closed: #{@file.closed?}"
	end
end