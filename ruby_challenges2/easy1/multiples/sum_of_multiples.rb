class SumOfMultiples
  DEFAULT_VALUES = [3, 5]

  def initialize(*values)
    @values = values
  end

  def self.to(limit)
    self.new(*DEFAULT_VALUES).to(limit)
  end

  def to(limit)
    sum_multiples(@values, limit)
  end

  private

  def sum_multiples(values, limit)
    values.reduce([]) do |multiples, value|
      multiples.concat((value...limit).step(value).to_a)
    end.uniq.sum
  end
end