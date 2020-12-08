require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0.0)
    @transaction = Transaction.new(10.0)
  end

  def test_accept_money
    @transaction.amount_paid = 10.0

    before_accept = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    after_accept = @cash_register.total_money

    assert_equal(before_accept + 10.0, after_accept)
  end

  def test_change
    @transaction.amount_paid = 15.0
    assert_equal(5.0, @cash_register.change(@transaction))
    @transaction.amount_paid = 10.0
    assert_equal(0.0, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $10.0.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end
end