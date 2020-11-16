require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'

SimpleCov.start
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @cash_register = CashRegister.new(0.0)
  end
  
  def test_accept_money
    starting_amount = @cash_register.total_money
    transaction_amount = 10

    transaction = Transaction.new(starting_amount)
    transaction.amount_paid = transaction_amount

    @cash_register.accept_money(transaction)
    assert_equal(starting_amount + transaction_amount, @cash_register.total_money)
  end

  def test_change
    cost = 100
    amount_paid = 0
    transaction = Transaction.new(cost)
    assert_equal(amount_paid - cost, @cash_register.change(transaction))
    transaction.amount_paid = 110
    assert_equal(10, @cash_register.change(transaction))
  end

  def test_give_receipt
    cost = 100
    transaction = Transaction.new(cost)
    out, err = capture_io { @cash_register.give_receipt(transaction) }
    assert_equal("You've paid $#{cost}.\n", out)
  end
end