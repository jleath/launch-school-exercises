require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'transaction'

Minitest::Reporters.use!

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(10.0)
    input = StringIO.new("10\n")
    output = StringIO.new

    transaction.prompt_for_payment(input: input, output: output)

    assert_equal(10, transaction.amount_paid)
  end
end