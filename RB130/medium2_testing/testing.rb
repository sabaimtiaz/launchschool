require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
	def test_accept_money
		register = CashRegister.new(200)
		transaction = Transaction.new(10)
		transaction.amount_paid = 50

		previous = register.total_money
		register.accept_money(transaction)
		current = register.total_money

		assert_equal(previous + transaction.amount_paid, current)
	end

	def test_change
		register = CashRegister.new(200)
		transaction = Transaction.new(10)
		transaction.amount_paid = 50
		amount_to_give = register.change(transaction)
		assert_equal(amount_to_give, 50-10 )
	end

	def test_give_receipt
		register = CashRegister.new(200)
		transaction = Transaction.new(35)
		assert_output("You've paid $#{transaction.item_cost}.\n") do
			register.give_receipt(transaction)
		end
	end
end