require 'minitest/autorun'

class TestEmpty < MiniTest::Test

	def setup
		@list = []
	end

	def test_empty_object
		#assert_equal(@list.empty?, true)
		assert_empty(@list)
	end
end