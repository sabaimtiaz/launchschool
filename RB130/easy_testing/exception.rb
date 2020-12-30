class Employee
	def hire
		raise("NoExperienceError")
	end
end
employee = Employee.new

require 'minitest/autorun'

class TestException < MiniTest::Test
	def test_exception
		assert_raises("NoExperienceError") { employee.hire }
	end
end