class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0 # dont need to add an @ when we have balance available through attr_readr
  end
end

# #his means that Ruby will automatically create a method called balance that returns the value of the @balance instance variable. The body of the positive_balance? method will evaluate to calling the balance method of the class, which will return the value of the @balance instance variable. 
# If Ben had omitted the attr_reader 
# (or had used an attr_writer rather than a reader or accessor) 
# then Alyssa would be right.