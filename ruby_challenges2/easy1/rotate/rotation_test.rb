require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'rotation'

Minitest::Reporters.use!

class RotationTest < Minitest::Test
  def test_single_digit
    assert_equal(3, max_rotation(3))
  end

  def test_two_digits
    assert_equal(53, max_rotation(35))
  end

  def test_three_digits
    assert_equal(15, max_rotation(105))
  end

  def test_big_number
    assert_equal(321579, max_rotation(735291))
  end

  def test_real_big_number
    assert_equal(7_321_609_845, max_rotation(8_703_529_146))
  end
end