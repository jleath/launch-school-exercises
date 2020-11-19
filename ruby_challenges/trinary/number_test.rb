require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

require_relative 'number'

class NumberTest < MiniTest::Test
  def test_bad_input
    base_10 = Number.new('1234a')
    base_8 = Number.new('12349', base: 8)
    base_3 = Number.new('120130102', base: 3)
    assert_equal(0, base_10.to_decimal)
    assert_equal(0, base_8.to_decimal)
    assert_equal(0, base_3.to_decimal)
  end

  def test_nonpositive_base
    assert_raises(ArgumentError) { Number.new("1234", base: -1) }
    assert_raises(ArgumentError) { Number.new("1234", base: 0) }
  end

  def test_noninteger_base
    assert_raises(ArgumentError) { Number.new("1234", base: "not an integer") }
  end

  def test_base_too_high
    assert_raises(ArgumentError) { Number.new("1234", base: 100) }
  end

  def test_base_10
    base_10 = Number.new('1234')
    assert_equal(1234, base_10.to_decimal)
    base_10 = Number.new('0')
    assert_equal(0, base_10.to_decimal)
  end

  def test_base_16
    base_16 = Number.new('abcdef', base: 16)
    assert_equal(11259375, base_16.to_decimal)
    base_16 = Number.new('012345', base: 16)
    assert_equal(74565, base_16.to_decimal)
  end

  def test_large_base
    base_20 = Number.new('0928jbca', base: 20)
    assert_equal(583836650, base_20.to_decimal)
    base_20 = Number.new('-0928jcbnn', base: 20)
    assert_equal(0, base_20.to_decimal)
  end

  def test_custom_charset
    base_10 = Number.new(')!@#$%^&*(', base: 10, valid_chars:')!@#$%^&*(')
    assert_equal(123456789, base_10.to_decimal)
  end
end