def num
	5
end

require 'minitest/autorun'

class TestNum < MiniTest::Test
	def test_num
		assert_equal(true, num.odd?)
	end
end
