require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'perfect_numbers'

MiniTest::Reporters.use!

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end

  def test_value_one
    assert_equal 'deficient', PerfectNumber.classify(1)
  end

  def test_large_perfect
    assert_equal 'perfect', PerfectNumber.classify(137438691328)
  end
end