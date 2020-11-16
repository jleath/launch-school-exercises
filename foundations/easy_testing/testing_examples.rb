require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def initialize
    @experience = 0.0
  end

  def hire
    raise NoExperienceError, "This applicant has NO experience" unless @experience > 0
    puts "You're hired!"
  end
end

class List
  def process
    self
  end
end

class TestExamples < MiniTest::Test
  def setup
    @odd_value = 3
    @str_example = 'XyZ'
    @nil_value = nil
    @empty_array = []
    @list_of_strings = ['wow', 'this', 'is', 'xyz', 'neat']
    @employee = Employee.new
    @numeric_object = Numeric.new
    @list_object = List.new
  end

  def test_is_odd
    assert_equal(true, @odd_value.odd?)
  end

  def test_is_xyz
    assert_equal('xyz', @str_example.downcase)
  end

  def test_is_nil
    assert_nil(@nil_value)
  end

  def test_empty_array
    assert_empty(@empty_array)
  end

  def test_includes_xyz
    assert_includes(@list_of_strings, 'xyz')
  end

  def test_raises_exception
    assert_raises(NoExperienceError) { @employee.hire }
  end

  def test_is_type
    assert_instance_of(Numeric, @numeric_object)
  end

  def test_kind
    assert_kind_of(Numeric, 12)
  end

  def test_same
    assert_same(@list_object, @list_object.process)
  end

  def test_refute_include
    @list_of_strings.delete('xyz')
    refute_includes(@list_of_strings, 'xyz')
  end
end