require 'minitest/autorun'

class TestObject < MiniTest::Test
	def setup
		@list = ["abc"]
	end

	def test_refute_includes
		refute_includes(@list, "xyz")
	end
end