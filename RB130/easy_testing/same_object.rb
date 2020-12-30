
require 'minitest/autorun'

class List
	attr_accessor :list
	def initialize
		@list = []
	end

	def process
		self
	end
end


class TestSameObject < MiniTest::Test
	def setup
		@list = List.new
	end

	def test_same_object
		assert_same(@list, @list.process)
 	end
end