class Length
  include Comparable

  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def <=>(other)
    other_value = case unit
    when :km then other.as_kilometers.value
    when :mi then other.as_miles.value
    when :nmi then other.as_nautical_miles.value
    end

    value <=> other_value
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

# The `sort` method, when called on an array, uses the `<=>` method to compare
# objects for sorting. The Length class has all the other comparison operators defined,
# but not `<=>`. We can remedy this by mixing the `Comparable` module into `Length` and
# defining the `<=>` method. We don't need to implement the other comparison methods
# because the inclusion of the `Comparison` module means we will get those for free
# when we define `<=>`