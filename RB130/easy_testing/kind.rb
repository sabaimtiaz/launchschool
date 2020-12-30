
require 'minitest/autorun'

class TestKind < MiniTest::Test

	def setup
		@value = Numeric.new
	end
	
	def test_kind
		assert_kind_of(Numeric, @value)
	end
end