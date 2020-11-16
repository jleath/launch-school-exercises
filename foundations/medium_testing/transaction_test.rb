require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'

require_relative 'transaction'

MiniTest::Reporters.use!

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end