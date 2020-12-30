require 'minitest/autorun'

class TestValue < MiniTest::Test
	def test_value
		value = "XYZ"
		assert_equal(value.downcase, 'xyz')
	end
end