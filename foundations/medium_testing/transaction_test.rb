require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
require 'stringio'

require_relative 'transaction'

SimpleCov.start
MiniTest::Reporters.use!

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    item_cost = 100
    input = StringIO.new("#{item_cost}\n")
    first_prompt = "You owe $#{item_cost}.\nHow much are you paying?\n"
    invalid_input_response = "That is not the correct amount. " \
                             "Please make sure to pay the full cost.\n"
    transaction = Transaction.new(item_cost)
    out, err = capture_io { transaction.prompt_for_payment(input: input) }
    assert_equal(first_prompt, out)

    # transaction = Transaction.new(item_cost)
    # input = StringIO.new("#{item_cost - 10}\n")
    # out, err = capture_io { transaction.prompt_for_payment(input: input) }
    # assert_equal(first_prompt + invalid_input_response, out)
  end
end