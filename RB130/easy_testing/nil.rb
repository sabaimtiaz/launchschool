require 'minitest/autorun'

class TestNil < MiniTest::Test
	def test_nil
		value = nil
		assert_nil(value)
	end
end