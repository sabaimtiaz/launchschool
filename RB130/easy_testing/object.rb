require 'minitest/autorun'

class TestObject < MiniTest::Test
	def setup
		@list = ["xyz"]
	end

	def test_object_includes
		assert_includes(@list, "xyz")
	end
end