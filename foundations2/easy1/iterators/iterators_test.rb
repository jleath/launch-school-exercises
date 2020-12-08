require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'iterators'

MiniTest::Reporters.use!

class IteratorsTest < MiniTest::Test
  def setup
    @all_odd = [1, 3, 5, 7]
    @all_even = [2, 4, 6, 8]
    @mixed = [1, 3, 5, 6]
    @empty = []
  end

  def test_all
    assert_equal(false, all?(@mixed, &:odd?))
    assert_equal(true, all?(@all_odd, &:odd?))
    assert_equal(true, all?(@all_even, &:even?))
    assert_equal(false, all?(@all_odd) { |value| value % 5 == 0 })
    assert_equal(true, all?(@all_odd) { |value| true })
    assert_equal(false, all?(@all_odd) { |value| false})
    assert_equal(true, all?(@empty) { |value| false })
  end

  def test_any
    assert_equal(true, any?(@mixed, &:even?))
    assert_equal(false, any?(@all_odd, &:even?))
    assert_equal(false, any?(@all_even, &:odd?))
    assert_equal(true, any?(@all_odd) { |value| value % 5 == 0 })
    assert_equal(true, any?(@all_odd) { |value| true })
    assert_equal(false, any?(@all_odd) { |value| false })
    assert_equal(false, any?(@empty) { |value| true })
  end

  def test_none
    assert_equal(false, none?(@mixed, &:even?))
    assert_equal(true, none?(@all_odd, &:even?))
    assert_equal(true, none?(@all_even, &:odd?))
    assert_equal(false, none?(@all_odd) { |value| value % 5 == 0 })
    assert_equal(false, none?(@all_odd) { |value| true })
    assert_equal(true, none?(@all_odd) { |value| false })
    assert_equal(true, none?(@empty) { |value| true })
  end

  def test_one
    assert_equal(true, one?(@mixed, &:even?))
    assert_equal(false, one?(@all_odd, &:odd?))
    assert_equal(false, one?(@all_even, &:even?))
    assert_equal(true, one?(@all_odd) { |value| value % 5 == 0 })
    assert_equal(false, one?(@all_odd) { |value| true })
    assert_equal(false, one?(@all_odd) { |value| false })
    assert_equal(false, one?(@empty) { |value| true })
  end
end
